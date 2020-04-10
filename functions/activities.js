const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.onCreateActivity = functions.firestore
    .document('/atividades/{politicoId}/atividadesPolitico/{documentId}')
    .onCreate(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const documentId = context.params.documentId;

        const timelineRef = admin
            .firestore()
            .collection('timeline');

        var atividade = null;
        var id = null;

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
                }
            });
    })
