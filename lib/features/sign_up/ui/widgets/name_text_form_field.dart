import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mk_stationery/core/theming/color_manager.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';
import 'package:mk_stationery/features/sign_up/logic/cubits/signup_cubit/signup_cubit.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<SignupCubit>().nameController,
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
        hintText: 'Name',
        suffixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
      ),
      style: AppTextStyles.body,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        if (value.length < 2) {
          return 'Name must be at least 2 characters';
        }
        return null;
      },
    );
  }
}
