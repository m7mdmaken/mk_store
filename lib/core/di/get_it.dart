import 'package:get_it/get_it.dart';
import 'package:mk_stationery/core/services/database_service.dart';
import 'package:mk_stationery/core/services/firebase_auth_service.dart';
import 'package:mk_stationery/core/services/firestore_service.dart';
import 'package:mk_stationery/features/login/data/repos/login_repo.dart';
import 'package:mk_stationery/features/login/logic/login_cubit/login_cubit.dart';
import 'package:mk_stationery/features/sign_up/data/repos/signup_repo.dart';
import 'package:mk_stationery/features/sign_up/logic/cubits/signup_cubit/signup_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  _registerFirebase();
  _registerRepositories();
  _registerCubits();
  _registerFirestore();
}

void _registerFirebase() {
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
}

void _registerFirestore() {
  getIt.registerLazySingleton<DatabaseService>(() => FirestoreService());
}

void _registerRepositories() {
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepo(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}

void _registerCubits() {
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(signupRepo: getIt<SignupRepo>()),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginRepo: getIt<LoginRepo>()),
  );
}
