const functions = require('firebase-functions');
const activitiesModule = require('./activities');
const favoriteActivityModule = require('./favorite_activity');
const followersModule = require('./followers');

exports.createActivities = functions.database.ref('/activities').onCreate(activitiesModule.onCreateActivity);
exports.createFavoriteActivity = functions.database.ref('/favorite_activity').onCreate(favoriteActivityModule.onCreateFavoriteActivity);
exports.deleteFavoriteActivity = functions.database.ref('/favorite_activity').onDelete(favoriteActivityModule.onDeleteFavoriteActivity);
exports.createFollowers = functions.database.ref('/followers').onCreate(followersModule.onCreateFollower);
exports.deleteFollowers = functions.database.ref('/followers').onDelete(followersModule.onDeleteFollower);
