const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.onCreateFollower = functions.firestore
    .document(`/${USUARIOS_SEGUINDO_COLLECTION}/{politicoId}/${USUARIOS_SEGUINDO_SUBCOLLECTION}/{followerId}`)
    .onCreate(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;

        const politicoDocumentRef = await admin.firestore()
            .collection(POLITICOS_COLLECTION)
            .doc(politicoId);

        const despesasPoliticoRef = politicoDocumentRef.collection(DESPESAS_POLITICO_SUBCOLLECTION);

        await admin.firestore().runTransaction((transaction) => {
            const politicoDocument = transaction.get(politicoDocumentRef);
            if (!politicoDocument.exists) {
                throw 'Document does not exist';
            }
            const quantidadeSeguidoresAtualizada = politicoDocument.data().quantidadeSeguidores + 1;
            transaction.update(politicoDocumentRef, { quantidadeSeguidores: quantidadeSeguidoresAtualizada });
            return transaction;
        });

        const timelineRef = admin
            .firestore()
            .collection(TIMELINE_COLLECTION)
            .doc(followerId)
            .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION);

        const querySnapshot = await despesasPoliticoRef.get();

        querySnapshot.forEach(doc => {
            if (doc.exists) {
                const activityId = doc.id;
                const activityData = doc.data();
                timelineRef.doc(activityId).set(activityData)
            }
        });
    });

exports.onDeleteFollower = functions.firestore
    .document(`/${USUARIOS_SEGUINDO_COLLECTION}/{politicoId}/${USUARIOS_SEGUINDO_SUBCOLLECTION}/{followerId}`)
    .onDelete(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;

        const politicoDocumentRef = await admin.firestore()
            .collection(POLITICOS_COLLECTION)
            .doc(politicoId);

        await admin.firestore().runTransaction((transaction) => {
            const politicoDocument = transaction.get(politicoDocumentRef);
            if (!politicoDocument.exists) {
                throw 'Document does not exist';
            }
            const quantidadeSeguidoresAtual = politicoDocument.data().quantidadeSeguidores;
            const quantidadeSeguidoresAtualizada = quantidadeSeguidoresAtual === 0 ? 0 : quantidadeSeguidoresAtual - 1;
            transaction.update(politicoDocumentRef, { quantidadeSeguidores: quantidadeSeguidoresAtualizada });
            return transaction;
        });

        const timelineActivitiesRef = admin
            .firestore()
            .collection(TIMELINE_COLLECTION)
            .doc(followerId)
            .collection(ATIVIDADES_TIMELINE_SUBCOLLECTION)
            .where(ID_POLITICO_FIELD, '==', politicoId);

        const querySnapshot = await timelineActivitiesRef.get();

        querySnapshot.forEach(doc => {
            if (doc.exists) {
                doc.ref.delete();
            }
        });

        const usuariosSeguindoPoliticoRef = admin
            .firestore()
            .collection(USUARIOS_SEGUINDO_COLLECTION)
            .doc(politicoId)
            .collection(USUARIOS_SEGUINDO_SUBCOLLECTION)
            .where(USER_ID_FIELD, '==', followerId);

        const querySnapshotUsuariosSeguindoPolitico = await usuariosSeguindoPoliticoRef.get();

        querySnapshotUsuariosSeguindoPolitico.forEach(doc => {
            if (doc.exists) {
                doc.ref.delete();
            }
        })
    });