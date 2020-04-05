const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.onCreateFollower = functions.firestore
    .document('/usuarios_seguindo/{politicoId}/usuariosSeguindo/{followerId}')
    .onCreate(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;

        const politicoDocumentRef = await admin.firestore()
            .collection('politicos')
            .doc(politicoId);

        const despesasPoliticoRef = politicoDocumentRef.collection('atividadesPolitico');

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

        const proposicoesPoliticoRef = admin
            .firestore()
            .collection('atividades')
            .doc(politicoId)
            .collection('atividadesPolitico');

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

exports.onCreateFavorita = functions.firestore
    .document('/posts_favoritos/{userId}/postsFavoritosUsuario/{documentId}')
    .onCreate(async (snapshot, context) => {
        const userId = context.params.userId;
        const documentId = context.params.documentId;

        //atualizar o conteudo na timeline
        const timelineActivitiesRef = admin
        .firestore()
        .collection('timeline')
        .doc(userId)
        .collection('atividadesTimeline')
        .doc(documentId);

        timelineActivitiesRef.set({"favorito": true});

    });


    exports.onDeleteFavorita = functions.firestore
    .document('/posts_favoritos/{userId}/postsFavoritosUsuario/{documentId}')
    .onDelete(async (snapshot, context) => {
        const userId = context.params.userId;
        const documentId = context.params.documentId;

        //atualizar o conteudo na timeline
        const timelineActivitiesRef = admin
        .firestore()
        .collection('timeline')
        .doc(userId)
        .collection('atividadesTimeline')
        .doc(documentId);

        timelineActivitiesRef.set({"favorito": false});
        
    });

exports.onDeleteFollower = functions.firestore
    .document('/usuarios_seguindo/{politicoId}/usuariosSeguindo/{followerId}')
    .onDelete(async (snapshot, context) => {
        const politicoId = context.params.politicoId;
        const followerId = context.params.followerId;

        const politicoDocumentRef = await admin.firestore()
            .collection('politicos')
            .doc(politicoId);

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

        const timelineActivitiesRef = admin
            .firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('atividadesTimeline')
            .where('idPolitico', '==', politicoId);

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
            .where('userId', '==', followerId);

        const querySnapshotUsuariosSeguindoPolitico = await usuariosSeguindoPoliticoRef.get();

        querySnapshotUsuariosSeguindoPolitico.forEach(doc => {
            if (doc.exists) {
                doc.ref.delete();
            }
        })
    });