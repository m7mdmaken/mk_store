import 'package:flutter/widgets.dart';
import 'package:mk_stationery/features/login/logic/login_cubit/login_cubit.dart';
import '/core/utils/app_regex.dart';

import '/features/login/ui/widgets/email_text_form_field.dart';
import '/features/login/ui/widgets/password_text_form_field.dart';
import '/features/login/ui/widgets/password_validations_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isPasswordVisible = false;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    _emailController = context.read<LoginCubit>().emailController;
    _passwordController = context.read<LoginCubit>().passwordController;

    // Add listener to password controller to update validation states
    _passwordController.addListener(_updatePasswordValidations);

    super.initState();
  }

  void _updatePasswordValidations() {
    final password = _passwordController.text;
    setState(() {
      hasLowerCase = AppRegex.hasLowerCase(password);
      hasUpperCase = AppRegex.hasUpperCase(password);
      hasSpecialCharacters = AppRegex.hasSpecialCharacters(password);
      hasNumber = AppRegex.hasNumber(password);
      hasMinLength = AppRegex.hasMinLength(password);
    });
  }

  @override
  void dispose() {
    _passwordController.removeListener(_updatePasswordValidations);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          EmailTextFormField(emailController: _emailController),
          SizedBox(height: 15.h),
          PasswordTextFormField(
            isPasswordVisible: _isPasswordVisible,
            onToggleVisibility: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            passwordController: _passwordController,
          ),
          SizedBox(height: 15.h),
          PasswordValidationsChecker(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
