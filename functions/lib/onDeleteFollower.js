const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.onDeleteFollower = functions.firestore
    .document('/usuarios_seguindo/{politicoId}/usuariosSeguindo/{followerId}')
    .onDelete(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;

        const politicoDocumentRef = await admin.firestore()
            .collection('politicos')
            .doc(politicoId);

        await decrementarNumeroSeguidoresPolitico(politicoDocumentRef);
        await deletarAtividadesPoliticoDaTimelineUsuario(followerId, politicoId);
        await deletarRegistroDeUsuarioSeguindoPolitico(politicoId, followerId);
        await criarAcaoUsuarioDeixandoDeSeguirPolitico(politicoDocumentRef, politicoId, followerId);
    });

async function criarAcaoUsuarioDeixandoDeSeguirPolitico(politicoDocumentRef, politicoId, followerId) {
    const todayDate = new Date();
    const dd = String(todayDate.getDate()).padStart(2, '0');
    const mm = String(todayDate.getMonth() + 1).padStart(2, '0');
    const yyyy = todayDate.getFullYear();
    const today = dd + '/' + mm + '/' + yyyy;

    const politico = await politicoDocumentRef.get();

    const acao = {
        'tipo': 'DEIXAR_SEGUIR',
        'data': admin.firestore.Timestamp.fromDate(todayDate),
        'nomePolitico': politico.data().nomeEleitoral,
        'idPolitico': politicoId,
        'mensagem': 'Deixei de seguir o político ' + politico.data().nomeEleitoral + ' no dia ' + today,
        'urlFotoPolitico': politico.data().urlFoto,
        'sexoPolitico': politico.data().sexo
    };

    admin.firestore().collection('acoes').doc(followerId).collection('acoesUsuario').add(acao);
}

async function deletarRegistroDeUsuarioSeguindoPolitico(politicoId, followerId) {
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
    });
}

async function deletarAtividadesPoliticoDaTimelineUsuario(followerId, politicoId) {
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
}

async function decrementarNumeroSeguidoresPolitico(politicoDocumentRef) {
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
}
