import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/core/helpers/shared_preferences_helper.dart';
import 'package:mk_stationery/features/login/data/models/user_entity.dart';

Future<void> deleteUserIfExists(
  User? user, {
  required firebaseAuthService,
}) async {
  if (user != null) {
    await firebaseAuthService.deleteUser();
  }
}

Future<void> addUserData({
  required UserEntity userEntity,
  required databaseService,
}) async {
  await databaseService.addData(
    documentId: userEntity.uId,
    path: 'users',
    data: userEntity.toMap(),
  );
}

Future<UserEntity> getUserData({
  required String uId,
  required databaseService,
}) async {
  final data = await databaseService.getData(path: 'users', documentId: uId);
  return UserEntity.fromMap(data);
}

Future<void> saveUserData({required UserEntity userEntity}) async {
  await SharedPrefsHelper.saveData(
    key: kUserDataKey,
    value: jsonEncode(userEntity.toMap()),
  );
}
