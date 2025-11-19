import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mk_stationery/core/helpers/auth_helper.dart';
import 'package:mk_stationery/core/networking/errors/custom_execption.dart';
import 'package:mk_stationery/core/networking/errors/failure.dart';
import 'package:mk_stationery/core/services/database_service.dart';
import 'package:mk_stationery/core/services/firebase_auth_service.dart';
import 'package:mk_stationery/features/login/data/models/user_entity.dart';

class LoginRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  User? user;

  LoginRepo({required this.firebaseAuthService, required this.databaseService});

  Future<Either<Failure, UserEntity>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );

      //  var userEntity = await getUserData(uId: user.uid);
      var userEntity = UserEntity.fromFirebaseUser(user: user);
      //  await saveUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(
        ServerFailure('1An unknown error occurred. Please try again later.'),
      );
    }
  }

  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthService.signInWithGoogle();

      var isUserExists = await databaseService.isDocumentExists(
        path: 'users',
        documentId: user.uid,
      );

      UserEntity userEntity;
      if (isUserExists) {
        userEntity = await getUserData(
          uId: user.uid,
          databaseService: databaseService,
        );
      } else {
        userEntity = UserEntity.fromFirebaseUser(user: user);
        await addUserData(
          userEntity: userEntity,
          databaseService: databaseService,
        );
      }

      await saveUserData(userEntity: userEntity);
      return Right(userEntity);
    } catch (e) {
      await deleteUserIfExists(user, firebaseAuthService: firebaseAuthService);

      return Left(
        ServerFailure('An unknown error occurred. Please try again later.'),
      );
    }
  }
}
