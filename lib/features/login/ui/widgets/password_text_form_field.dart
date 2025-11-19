import 'package:flutter/material.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';
import '/core/theming/text_styles.dart';

import '/core/utils/app_regex.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;
  final TextEditingController passwordController;

  const PasswordTextFormField({
    super.key,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: AppTextStyles.caption,
        //hintText: 'Enter your Password',
        prefixIcon: const Icon(Icons.lock_outline),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorsManager.textDark, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorsManager.beige, width: 1.3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      style: AppTextStyles.body,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !AppRegex.isPasswordValid(value)) {
          return 'Please enter a valid password';
        }
        return null;
      },
    );
  }
}
