import 'package:flutter/material.dart';
import '/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidationsChecker extends StatelessWidget {
  const PasswordValidationsChecker({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        singleValitationChecker(hasLowerCase, "Contains lowercase letter"),
        singleValitationChecker(hasUpperCase, "Contains uppercase letter"),
        singleValitationChecker(
          hasSpecialCharacters,
          "Contains special character",
        ),
        singleValitationChecker(hasNumber, "Contains number"),
        singleValitationChecker(hasMinLength, "Has minimum length of 8"),
      ],
    );
  }

  Row singleValitationChecker(bool hasValidated, String text) {
    return Row(
      children: [
        Icon(
          hasValidated ? Icons.check_circle : Icons.cancel,
          color: hasValidated ? Colors.green : Colors.red,
          size: 16,
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style:
              hasValidated
                  ? AppTextStyles.accent.copyWith(
                    decoration: TextDecoration.lineThrough,
                  )
                  : AppTextStyles.caption,
        ),
      ],
    );
  }
}
