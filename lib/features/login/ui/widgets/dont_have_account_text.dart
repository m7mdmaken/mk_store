import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/core/routing/routes_consts.dart';
import '/core/theming/text_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "Don't have an account? ", style: AppTextStyles.body),
          TextSpan(
            text: 'Sign Up',
            style: AppTextStyles.body,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RoutesConsts.signupView);
                  },
          ),
        ],
      ),
    );
  }
}
