const functions = require("firebase-functions");
const admin = require("firebase-admin");

/**
 * This function is thrigered when a user starts following a politic and it does:
 * - Increment by one the politic followersCount
 * - Add the politic activities to the user's timeline
 * - Add a user action for the user indicating that the user followed the politic
 */
exports.onCreateFollower = functions.firestore
    .document('/usuarios_seguindo/{politicoId}/usuariosSeguindo/{followerId}')
    .onCreate(async (snapshot, context) => {
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
                const quantidadeSeguidoresAtualizada = quantidadeSeguidoresAtual + 1;
                transaction.update(politicoDocumentRef, { quantidadeSeguidores: quantidadeSeguidoresAtualizada });
            });
        });

        const atividadesPoliticoRef = admin
            .firestore()
            .collection('atividades')
            .doc(politicoId)
            .collection('atividadesPolitico');

        const timelineRef = admin
            .firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('atividadesTimeline');

        const querySnapshotProposicao = await atividadesPoliticoRef.get();

        querySnapshotProposicao.forEach(doc => {
            if (doc.exists) {
                const activityId = doc.id;
                const activityData = doc.data();
                timelineRef.doc(activityId).set(activityData)
            }
        });

        politicoDocumentRef.get().then(p => {
            const acao = {
                'tipo': 'SEGUIR',
                'data': admin.firestore.Timestamp.fromDate(todayDate),
                'nomePolitico': p.data().nomeEleitoral,
                'idPolitico': politicoId,
                'mensagem': 'Segui o político ' + p.data().nomeEleitoral + ' no dia ' + today,
                'urlFotoPolitico': p.data().urlFoto,
                'sexoPolitico': p.sexo
            };

            admin.firestore().collection('acoes').doc(followerId).collection('acoesUsuario').add(acao);
        });
    });