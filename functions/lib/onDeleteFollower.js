const functions = require("firebase-functions");
const admin = require("firebase-admin");

/**
 * This function is thrigered when a user starts following a politic and it does:
 * - Decrement by one the politic followersCount
 * - Remove the politic activities from the user's timeline
 * - Add a user action for the user indicating that the user unfollowed the politic
 */
exports.onDeleteFollower = functions.firestore
    .document('/usuarios_seguindo/{politicoId}/usuariosSeguindo/{followerId}')
    .onDelete(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;
        const todayDate = new Date();
        const dd = String(todayDate.getDate()).padStart(2, '0');
        const mm = String(todayDate.getMonth() + 1).padStart(2, '0');
        const yyyy = todayDate.getFullYear();

        let today = dd + '/' + mm + '/' + yyyy;

        const politicoDocumentRef = await admin.firestore()
            .collection('politicos')
            .doc(politicoId);

        await admin.firestore().runTransaction((transaction) => {
            return transaction.get(politicoDocumentRef).then((politicoDocument) => {
                if (!politicoDocument.exists) {
                    throw 'Document does not exist';
                }
                const quantidadeSeguidoresAtual = politicoDocument.data().quantidadeSeguidores || 0;
                const quantidadeSeguidoresAtualizada = quantidadeSeguidoresAtual === 0 ? 0 : quantidadeSeguidoresAtual - 1;
                transaction.update(politicoDocumentRef, { quantidadeSeguidores: quantidadeSeguidoresAtualizada });
            });
        });

        const timelineActivitiesRef = admin
            .firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('atividadesTimeline')
            .where('idPolitico', '==', politicoId);

        const timelineActivitiesPropRef = admin
            .firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('atividadesTimeline')
            .where('idPoliticoAutor', '==', politicoId);


        const querySnapshot = await timelineActivitiesRef.get();
        const querySnapshotProp = await timelineActivitiesPropRef.get();

        querySnapshot.forEach(doc => {
            if (doc.exists) {
                doc.ref.delete();
            }
        });

        querySnapshotProp.forEach(doc => {
            if (doc.exists) {
                doc.ref.delete();
            }
        });

        const usuariosSeguindoPoliticoRef = admin
            .firestore()
            .collection('usuarios_seguindo')
            .doc(politicoId)
            .collection('usuariosSeguindo')
            .where('userId', '==', followerId);

        const querySnapshotUsuariosSeguindoPolitico = await usuariosSeguindoPoliticoRef.get();

        querySnapshotUsuariosSeguindoPolitico.forEach(doc => {
            if (doc.exists) {
                doc.ref.delete();
            }
        })

        politicoDocumentRef.get().then(p => {

            const acao = {
                'tipo': 'DEIXAR_SEGUIR',
                'data': admin.firestore.Timestamp.fromDate(todayDate),
                'nomePolitico': p.data().nomeEleitoral,
                'idPolitico': politicoId,
                'mensagem': 'Deixei de seguir o político ' + p.data().nomeEleitoral + ' no dia ' + today,
                'urlFotoPolitico': p.data().urlFoto,
                'sexoPolitico': p.sexo
            };

            admin.firestore().collection('acoes').doc(followerId).collection('acoesUsuario').add(acao);
        });
    });