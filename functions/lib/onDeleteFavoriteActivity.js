const functions = require("firebase-functions");
const admin = require("firebase-admin");

/**
 * Update a post to unfavorited when the users unfavorite a post
 */
exports.onDeleteFavoriteActivity = functions.firestore
    .document('/posts_favoritos/{userId}/postsFavoritosUsuario/{documentId}')
    .onDelete(async (snapshot, context) => {
        const userId = context.params.userId;
        const documentId = context.params.documentId;

        const timelineActivitiesRef = admin
            .firestore()
            .collection('timeline')
            .doc(userId)
            .collection('atividadesTimeline')
            .doc(documentId);

        timelineActivitiesRef.update({ "favorito": false });
    });