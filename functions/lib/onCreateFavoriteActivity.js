const functions = require("firebase-functions");
const admin = require("firebase-admin");

/**
 * Update a post to favorited when the users favorite a post
 */
exports.onCreateFavoriteActivity = functions.firestore
    .document('/posts_favoritos/{userId}/postsFavoritosUsuario/{documentId}')
    .onCreate(async (snapshot, context) => {
        const userId = context.params.userId;
        const documentId = context.params.documentId;

        const timelineActivitiesRef = admin
            .firestore()
            .collection('timeline')
            .doc(userId)
            .collection('atividadesTimeline')
            .doc(documentId);

        await timelineActivitiesRef.update({ "favorito": true });
    });