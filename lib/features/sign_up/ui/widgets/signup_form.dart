import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';
import 'package:mk_stationery/core/widgets/app_text_button.dart';

import 'package:mk_stationery/features/sign_up/logic/cubits/signup_cubit/signup_cubit.dart';
import 'package:mk_stationery/features/sign_up/ui/widgets/email_text_form_field.dart';
import 'package:mk_stationery/features/sign_up/ui/widgets/name_text_form_field.dart';
import 'package:mk_stationery/features/sign_up/ui/widgets/password_confirmation_text_form_field.dart';
import 'package:mk_stationery/features/sign_up/ui/widgets/password_text_form_field.dart';

import 'package:mk_stationery/features/sign_up/ui/widgets/terms_and_conditions.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          const NameTextFormField(),
          const SizedBox(height: 18),
          const EmailTextFormField(),
          const SizedBox(height: 18),
          PasswordTextFormField(
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  isPasswordObscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          PasswordConfirmationTextFormField(
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  isPasswordConfirmationObscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const TermsAndConditions(),
          const SizedBox(height: 40),
          AppTextButton(
            buttonText: "Create Account",
            textStyle: AppTextStyles.button,
            onPressed: () {
              validateThenDoSignup(context);
            },
          ),
        ],
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignUpStates();
    }
  }
}
