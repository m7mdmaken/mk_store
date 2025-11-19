import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:mk_stationery/features/login/data/models/user_entity.dart';
import 'package:mk_stationery/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginStateInitial());
  final LoginRepo loginRepo;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late String email, password;

  Future<void> emitSignInWithGoogle() async {
    emit(LoginLoading());

    final user = await loginRepo.signInWithGoogle();

    user.fold(
      (gotFailure) => emit(LoginFailure(errorMessage: gotFailure.message)),
      (gotUserEntity) => emit(LoginSuccess(userEntity: gotUserEntity)),
    );
  }

  Future<void> emitSignIn() async {
    emit(LoginLoading());

    final user = await loginRepo.logInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    user.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
