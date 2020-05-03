const functions = require("firebase-functions");
const admin = require("firebase-admin");

/**
 * Update photoUrl field on the collection usuarios_seguindo of each politic that the user follows.
 * This function only do something when the user in fact changes his photo
 */
exports.onUpdateUser = functions.firestore
    .document('/users/{userId}')
    .onUpdate(async (change, context) => {
        const userId = context.params.userId;
        const previousUser = change.before.data();
        const newUser = change.after.data();

        if (newUser.photoUrl !== previousUser.photoUrl) {
            const newPhotoUrl = newUser.photoUrl;

            const querySnapshotPoliticosSeguidosUsuario = await admin
                .firestore()
                .collection('politicos_seguidos')
                .doc(userId)
                .collection('politicosSeguidos')
                .get();

            querySnapshotPoliticosSeguidosUsuario.forEach(async (politicoDoc) => {
                await admin
                    .firestore()
                    .collection('usuarios_seguindo')
                    .doc(politicoDoc.id)
                    .collection('usuariosSeguindo')
                    .doc(userId)
                    .update({ "photoUrl": newPhotoUrl });
            });
        }
    })