import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:mk_stationery/features/login/data/models/user_entity.dart';

import 'package:mk_stationery/features/sign_up/data/repos/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signupRepo}) : super(SignupInitial());
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  // TextEditingController phoneController = TextEditingController();

  final SignupRepo signupRepo;
  Future<void> emitSignUpStates() async {
    emit(SignupLoading());
    final result = await signupRepo.signUpWithEmailAndPassword(
      emailController.text,
      passwordController.text,
      nameController.text,
    );
    result.fold(
      (failure) => emit(SignupFailure(failure.toString())),
      (userEntity) => emit(SignupSuccess(userEntity)),
    );
  }
}
