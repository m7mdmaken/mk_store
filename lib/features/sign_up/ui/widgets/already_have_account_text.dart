import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mk_stationery/core/routing/routes_consts.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: AppTextStyles.subhead,
          ),
          TextSpan(
            text: 'Login',
            style: AppTextStyles.headline,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesConsts.loginView,
                    );
                  },
          ),
        ],
      ),
    );
  }
}
