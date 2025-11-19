import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';
import 'package:mk_stationery/core/utils/app_regex.dart';
import 'package:mk_stationery/features/sign_up/logic/cubits/signup_cubit/signup_cubit.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool isObscureText;
  final Widget? suffixIcon;

  const PasswordTextFormField({
    super.key,
    required this.isObscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<SignupCubit>().passwordController,
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
          borderSide: BorderSide(color: ColorsManager.softOrange, width: 1.3),
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
        hintText: 'Password',
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
      ),
      style: AppTextStyles.body,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (!AppRegex.isPasswordValid(value)) {
          return 'Password must be at least 8 characters with uppercase, lowercase, and number';
        }
        return null;
      },
    );
  }
}
