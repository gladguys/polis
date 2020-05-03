const functions = require("firebase-functions");
const admin = require("firebase-admin");

/**
 * Update photoUrl field on the collection usuarios_seguindo of each politic that the user follows.
 * This function only do something when the user in fact changes his photo
 */
exports.onUpdateUser = functions.firestore
    .document('/users/{userId}')
    .onCreate(async (change, context) => {
        const userId = context.params.userId;
        const previousUser = change.before.data();
        const newUser = change.after.data();

        if (newUser.photoURL !== previousUser.photoURL) {
            const newPhotoUrl = newUser.photoURL;

            const politicosSeguidosUsuario = await admin
                .firestore()
                .collection('politicos_seguidos')
                .doc(userId)
                .collection('politicosSeguidos')
                .get();

            politicosSeguidosUsuario.forEach(async (politico) => {
                await admin
                    .firestore()
                    .collection('usuarios_seguindo')
                    .doc(politico.id)
                    .collection('usuariosSeguindo')
                    .doc(userId)
                    .update({ "photoUrl": newPhotoUrl });
            });
        }
    })