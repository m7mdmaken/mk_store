import 'package:get_it/get_it.dart';
import 'package:mk_stationery/core/services/database_service.dart';
import 'package:mk_stationery/core/services/firebase_auth_service.dart';
import 'package:mk_stationery/core/services/firestore_service.dart';
import 'package:mk_stationery/features/login/data/repos/login_repo.dart';
import 'package:mk_stationery/features/login/logic/login_cubit/login_cubit.dart';

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
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}

void _registerCubits() {
  // Factory: new instance every time (e.g. per screen)
  // getIt.registerFactory<SignupCubit>(
  //   () => SignupCubit(authRepo: getIt<AuthRepo>()),
  // );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(authRepo: getIt<AuthRepo>()),
  );
}
