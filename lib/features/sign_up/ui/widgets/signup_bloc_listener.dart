import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_stationery/core/routing/routes_consts.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';

import 'package:mk_stationery/features/sign_up/logic/cubits/signup_cubit/signup_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          showDialog(
            context: context,
            builder:
                (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.primary,
                  ),
                ),
          );
        } else if (state is SignupSuccess) {
          Navigator.pop(context);
          showSuccessDialog(context);
        } else if (state is SignupFailure) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  icon: const Icon(Icons.error, color: Colors.red, size: 32),
                  content: Text(state.errorMessage, style: AppTextStyles.body),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Got it', style: AppTextStyles.caption),
                    ),
                  ],
                ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Success'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text('Account created successfully!')],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: ColorsManager.softOrange,
              disabledForegroundColor: Colors.grey.withAlpha(1),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesConsts.loginView,
                (route) => false,
              );
            },
            child: const Text('Continue'),
          ),
        ],
      );
    },
  );
}
