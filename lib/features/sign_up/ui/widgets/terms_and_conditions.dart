import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By creating an account, you agree to our ',
            style: AppTextStyles.body,
          ),
          TextSpan(text: 'Terms & Conditions', style: AppTextStyles.headline),
          TextSpan(text: ' and ', style: AppTextStyles.subhead),
          TextSpan(text: 'Privacy Policy', style: AppTextStyles.headline),
        ],
      ),
    );
  }
}
