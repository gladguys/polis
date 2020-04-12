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

        const atividadesPoliticoRef = admin
            .firestore()
            .collection('atividades')
            .doc(politicoId)
            .collection('atividadesPolitico');

        const timelineRef = admin
            .firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('atividadesTimeline');

        const querySnapshotProposicao = await atividadesPoliticoRef.get();

        querySnapshotProposicao.forEach(doc => {
            if (doc.exists) {
                const activityId = doc.id;
                const activityData = doc.data();
                timelineRef.doc(activityId).set(activityData)
            }
        });
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


exports.onCreateFavoriteActivity = functions.firestore
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

        timelineActivitiesRef.update({ "favorito": true });

    });

exports.onDeleteFavoriteActivity = functions.firestore
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

        timelineActivitiesRef.update({ "favorito": false });

    });

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
