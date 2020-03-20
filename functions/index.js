const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.onCreateFollower = functions.firestore
    .document("/usuarios_seguindo/{politicoId}/usuariosSeguindo/{followerId}")
    .onCreate(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;

        const followedPoliticActivitiesRef = admin
            .firestore()
            .collection('atividades')
            .doc(politicoId)
            .collection('despesasPolitico');

        const timelineActivitiesRef = admin
            .firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('atividadesTimeline');


        const querySnapshot = await followedPoliticActivitiesRef.get();

        querySnapshot.forEach(doc => {
            if (doc.exists) {
                const activityId = doc.id;
                const activityData = doc.data();
                timelineActivitiesRef.doc(activityId).set(activityData)
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
    });