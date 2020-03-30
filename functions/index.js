const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.onCreateFollower = functions.firestore
    .document("/usuarios_seguindo/{politicoId}/usuariosSeguindo/{followerId}")
    .onCreate(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;

        const despesasPoliticoRef = admin
            .firestore()
            .collection('atividades')
            .doc(politicoId)
            .collection('despesasPolitico');

        const proposicoesPoliticoRef = admin
            .firestore()
            .collection('atividades')
            .doc(politicoId)
            .collection('proposicoesPolitico');

        const timelineRef = admin
            .firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('atividadesTimeline');


        const querySnapshotDespesa = await despesasPoliticoRef.get();
        const querySnapshotProposicao = await proposicoesPoliticoRef.get();

        querySnapshotDespesa.forEach(doc => {
            if (doc.exists) {
                const activityId = doc.id;
                const activityData = doc.data();
                timelineRef.doc(activityId).set(activityData)
            }
        });
        
        querySnapshotProposicao.forEach(doc => {
            if (doc.exists) {
                const activityId = doc.id;
                const activityData = doc.data();
                timelineRef.doc(activityId).set(activityData)
            }
        });
    });

exports.onDeleteFollower = functions.firestore
    .document("/usuarios_seguindo/{politicoId}/usuariosSeguindo/{followerId}")
    .onDelete(async (snapshot, context) => {

        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;

        const timelineActivitiesRef = admin
            .firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('atividadesTimeline')
            .where("idPolitico", "==", politicoId)

        const querySnapshot = await timelineActivitiesRef.get();

        querySnapshot.forEach(doc => {
            if (doc.exists) {
                doc.ref.delete();
            }
        });

        const usuariosSeguindoPoliticoRef = admin
            .firestore()
            .collection('usuarios_seguindo')
            .doc(politicoId)
            .collection('usuariosSeguindo')
            .where("userId", "==", followerId);

        const querySnapshotUsuariosSeguindoPolitico = await usuariosSeguindoPoliticoRef.get();

        querySnapshotUsuariosSeguindoPolitico.forEach(doc => {
            if (doc.exists) {
                doc.ref.delete();
            }
        })
    });