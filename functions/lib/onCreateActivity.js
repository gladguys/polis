const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.onCreateActivity = functions.firestore
    .document('/atividades/{politicoId}/atividadesPolitico/{documentId}')
    .onCreate(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const documentId = context.params.documentId;

        const timelineRef = admin
            .firestore()
            .collection('timeline');

        let atividade = null;
        let id = null;

        let docAtividadeCriada = await getDocAtividadeCriada(politicoId, documentId);
        if (docAtividadeCriada.exists) {

            atividade = await adicionaAtividadeTimelineUsuarios(docAtividadeCriada, politicoId, timelineRef);
            if (ehUmaProposicaoProjetoDeLei(atividade)) {
                incrementarContadorProjetoDeLei(atividade);
            }
        }
    });

function ehUmaProposicaoProjetoDeLei(atividade) {
    return atividade.tipoAtividade == 'PROPOSICAO' && atividade.sequencia === 1 && atividade.descricaoTipo === 'Projeto de Lei';
}

function incrementarContadorProjetoDeLei(atividade) {
    const incrementByOne = admin.firestore.FieldValue.increment(1);

    admin
        .firestore()
        .collection('politicos')
        .doc(politicoId)
        .update({ "totalProposicoes": incrementByOne });
}

async function getDocAtividadeCriada(politicoId, documentId) {
    return admin
        .firestore()
        .collection('atividades')
        .doc(politicoId)
        .collection('atividadesPolitico')
        .doc(documentId).get();
}

async function adicionaAtividadeTimelineUsuarios(docAtividadeCriada, politicoId, timelineRef) {
    let id = docAtividadeCriada.id;
    let atividade = docAtividadeCriada.data();
    let queryUsuariosSeguindoPolitico = await admin
        .firestore()
        .collection('usuarios_seguindo')
        .doc(politicoId)
        .collection('usuariosSeguindo')
        .get();

    queryUsuariosSeguindoPolitico.forEach(function (docUsuario) {
        timelineRef.doc(docUsuario.id).collection('atividadesTimeline').doc(id).create(atividade);
    });

    return atividade;
}
