import 'package:flutter/material.dart';
import 'package:mk_stationery/features/login/logic/login_cubit/login_cubit.dart';
import '/core/theming/text_styles.dart';
import '/core/widgets/app_text_button.dart';

import '/features/login/ui/widgets/dont_have_account_text.dart';
import '/features/login/ui/widgets/email_and_password.dart';
import '/features/login/ui/widgets/login_bloc_listener.dart';

import '/features/login/ui/widgets/terms_and_conditions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text("Welcome Back", style: AppTextStyles.headline),
              SizedBox(height: 15.h),
              Text(
                r"We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: AppTextStyles.caption,
              ),
              SizedBox(height: 25.h),
              EmailAndPassword(),
              SizedBox(height: 20.h),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text("forgot password?", style: AppTextStyles.body),
              ),
              SizedBox(height: 30.h),
              AppTextButton(
                buttonText: "Login",
                textStyle: AppTextStyles.button,
                onPressed: () {
                  validateThenLogin(context);
                },
              ),
              SizedBox(height: 20.h),
              AppTextButton(
                buttonText: "Login with Google",
                textStyle: AppTextStyles.button,
                onPressed: () {
                  validateThenLoginWithGoogle(context);
                },
              ),
              const TermsAndConditionsText(),
              SizedBox(height: 20.h),
              Center(child: const DontHaveAccountText()),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitSignIn();
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       content: Row(
      //         children: [
      //           CircularProgressIndicator(),
      //           SizedBox(width: 20.w),
      //           Text("Logging in...", style: AppTextStyles.body),
      //         ],
      //       ),
      //     );
      //   },
      // );
    }
  }

  void validateThenLoginWithGoogle(BuildContext context) {
    context.read<LoginCubit>().emitSignInWithGoogle();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20.w),
              Text("Logging in...", style: AppTextStyles.body),
            ],
          ),
        );
      },
    );
  }
}
