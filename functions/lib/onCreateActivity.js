const functions = require("firebase-functions");
const admin = require("firebase-admin");

/**
 * Every time a new activity is added for a politic this function add that activity to the timeline
 * of the users that follow that politic
 */
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

        admin
            .firestore()
            .collection('atividades')
            .doc(politicoId)
            .collection('atividadesPolitico')
            .doc(documentId).get().then(function (doc) {
                if (doc.exists) {
                    id = doc.id;
                    atividade = doc.data();
                    admin
                        .firestore()
                        .collection('usuarios_seguindo')
                        .doc(politicoId)
                        .collection('usuariosSeguindo')
                        .get().then(function (querySnapshot) {
                            querySnapshot.forEach(function (doc) {
                                timelineRef.doc(doc.id).collection('atividadesTimeline').doc(id).create(atividade);
                            });
                        });

                    if (atividade.tipoAtividade == 'PROPOSICAO' && atividade.sequencia === 1) {
                        const incrementByOne = admin.firestore.FieldValue.increment(1);

                        admin
                            .firestore()
                            .collection('politicos')
                            .doc(politicoId)
                            .update({ "totalProposicoes": incrementByOne });
                    }

                }
            });

    })