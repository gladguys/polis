const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.onCreateFollower = functions.firestore
    .document('/usuarios_seguindo/{politicoId}/usuariosSeguindo/{followerId}')
    .onCreate(async (snapshot, context) => {

        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;

        const politicoDocumentRef = await admin.firestore()
            .collection('politicos')
            .doc(politicoId);

        await incrementaNumeroSeguidoresDoPolitico(politicoDocumentRef);
        await adicionarAtividadesPoliticoNaTimelineUsuario(politicoId, followerId);
        await criarAcaoSeguirPoliticoParaUsuario(politicoDocumentRef, politicoId, followerId);
    });

async function criarAcaoSeguirPoliticoParaUsuario(politicoDocumentRef, politicoId, followerId) {
    const todayDate = new Date();
    const dd = String(todayDate.getDate()).padStart(2, '0');
    const mm = String(todayDate.getMonth() + 1).padStart(2, '0');
    const yyyy = todayDate.getFullYear();
    const today = dd + '/' + mm + '/' + yyyy;

    const politico = await politicoDocumentRef.get();
    const acao = buildAcao(todayDate, today, politico, politicoId);
    admin.firestore().collection('acoes').doc(followerId).collection('acoesUsuario').add(acao);
}

function buildAcao(todayDate, today, politico, politicoId) {
    return {
        'tipo': 'SEGUIR',
        'data': admin.firestore.Timestamp.fromDate(todayDate),
        'nomePolitico': politico.data().nomeEleitoral,
        'idPolitico': politicoId,
        'mensagem': 'Segui o político ' + politico.data().nomeEleitoral + ' no dia ' + today,
        'urlFotoPolitico': politico.data().urlFoto,
        'sexoPolitico': politico.data().sexo
    };
}

async function adicionarAtividadesPoliticoNaTimelineUsuario(politicoId, followerId) {
    const timelineRef = admin
        .firestore()
        .collection('timeline')
        .doc(followerId)
        .collection('atividadesTimeline');

    const recenteAtividadesPolitico = await getTop10RecentesAtividadesDoPolitico(politicoId);
    recenteAtividadesPolitico.forEach(atividadeDoc => {
        if (atividadeDoc.exists) {
            const id = atividadeDoc.id;
            const atividade = atividadeDoc.data();
            timelineRef.doc(id).set(atividade);
        }
    });
}

async function getTop10RecentesAtividadesDoPolitico(politicoId) {
    const atividadesPoliticoRef = admin
        .firestore()
        .collection('atividades')
        .doc(politicoId)
        .collection('atividadesPolitico');

    return await atividadesPoliticoRef.orderBy('dataAtualizacao',"desc").limit(10).get();
}

async function incrementaNumeroSeguidoresDoPolitico(politicoDocumentRef) {
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
}
