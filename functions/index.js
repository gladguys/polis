const admin = require('firebase-admin');
admin.initializeApp();

module.exports = {
    ...require("./lib/onCreateActivity"),
    ...require("./lib/onUpdateActivity"),
    ...require("./lib/onCreateFollower"),
    ...require("./lib/onDeleteFollower"),
    ...require("./lib/onCreateFavoriteActivity"),
    ...require("./lib/onDeleteFavoriteActivity"),
    ...require("./lib/onUpdateUser"),
}
