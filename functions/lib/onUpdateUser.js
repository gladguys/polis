const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.onUpdateUser = functions.firestore
    .document('/users/{userId}')
    .onUpdate(async (change, context) => {
        const userId = context.params.userId;
        const previousUser = change.before.data();
        const newUser = change.after.data();

        updateFotoUsuarioParaPoliticosSeguidos(userId, previousUser, newUser);
    });


function updateFotoUsuarioParaPoliticosSeguidos(userId, previousUser, newUser) {
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
}