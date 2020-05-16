const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.onUpdateActivity = functions.firestore
    .document('/atividades/{politicoId}/atividadesPolitico/{documentId}')
    .onUpdate(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const documentId = context.params.documentId;

        const timelineRef = admin
            .firestore()
            .collection('timeline');

        let docAtividadeAtualizada = await admin
            .firestore()
            .collection('atividades')
            .doc(politicoId)
            .collection('atividadesPolitico')
            .doc(documentId).get();

        if (docAtividadeAtualizada.exists) {
            atualizaDocAtividadeEmTimelinesDeUsuarios(timelineRef, docAtividadeAtualizada);
        }
    });

function atualizaDocAtividadeEmTimelinesDeUsuarios(timelineRef, docAtividadeAtualizada) {
    let id = docAtividadeAtualizada.id;
    let atividade = docAtividadeAtualizada.data();

    let querySnapshot = await admin
        .firestore()
        .collection('usuarios_seguindo')
        .doc(politicoId)
        .collection('usuariosSeguindo')
        .get();

    querySnapshot.forEach(function (doc) {
        timelineRef.doc(doc.id).collection('atividadesTimeline').doc(id).update(atividade);
    });
}