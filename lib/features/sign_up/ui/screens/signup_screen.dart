import 'package:flutter/material.dart';

import '/core/theming/text_styles.dart';
import '/features/sign_up/ui/widgets/already_have_account_text.dart';
import '/features/sign_up/ui/widgets/signup_bloc_listener.dart';
import '/features/sign_up/ui/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create Account', style: AppTextStyles.accent),
                const SizedBox(height: 8),
                Text(
                  'Sign up now and start exploring all that our app has to offer.',
                  style: AppTextStyles.button,
                ),
                const SizedBox(height: 36),
                Column(
                  children: [
                    const SignupForm(),
                    const SizedBox(height: 40),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
