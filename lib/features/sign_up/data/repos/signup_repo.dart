import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mk_stationery/core/helpers/auth_helper.dart';

import 'package:mk_stationery/core/networking/errors/custom_execption.dart';
import 'package:mk_stationery/core/networking/errors/failure.dart';
import 'package:mk_stationery/core/services/database_service.dart';
import 'package:mk_stationery/core/services/firebase_auth_service.dart';
import 'package:mk_stationery/features/login/data/models/user_entity.dart';

class SignupRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  User? user;

  SignupRepo({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.signUpWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      await addUserData(
        userEntity: UserEntity(email: email, name: name, uId: user.uid),
        databaseService: databaseService,
      );
      return Right(UserEntity.fromFirebaseUser(user: user));
    } on CustomException catch (e) {
      deleteUserIfExists(user, firebaseAuthService: firebaseAuthService);
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      log(" error in ===>AuthRepoImpl- signup: $e");
      deleteUserIfExists(user, firebaseAuthService: firebaseAuthService);
      return Left(
        ServerFailure('An unknown error occurred. Please try again later.'),
      );
    }
  }
}
