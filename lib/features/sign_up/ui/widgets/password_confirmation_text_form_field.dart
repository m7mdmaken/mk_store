import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';
import 'package:mk_stationery/features/sign_up/logic/cubits/signup_cubit/signup_cubit.dart';

class PasswordConfirmationTextFormField extends StatelessWidget {
  final bool isObscureText;
  final Widget? suffixIcon;

  const PasswordConfirmationTextFormField({
    super.key,
    required this.isObscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<SignupCubit>().passwordConfirmationController,
      obscureText: isObscureText,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.textDark, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.beige, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: AppTextStyles.caption,
        hintText: 'Confirm Password',
        suffixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
      ),
      style: AppTextStyles.body,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != context.read<SignupCubit>().passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
