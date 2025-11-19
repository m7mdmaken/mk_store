import 'package:flutter/material.dart';
import '/core/theming/text_styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging in, you agree to our',
            style: AppTextStyles.body,
          ),
          TextSpan(text: ' Terms & Conditions', style: AppTextStyles.caption),
          TextSpan(
            text: ' and',
            style: AppTextStyles.caption.copyWith(height: 1.5),
          ),
          TextSpan(text: ' Privacy Policy', style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
