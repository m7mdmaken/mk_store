import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_weight.dart';

class AppTextStyles {
  // عناوين رئيسية
  static const TextStyle headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.textDark, // رمادي مزرق أنيق
  );

  // العناوين الثانوية
  static const TextStyle subhead = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.sageGreen, // أخضر زيتوني هادئ
  );

  // النصوص الأساسية
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.textDark,
  );

  // النصوص الثانوية / الملاحظات
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.grayBlue, // رمادي أزرق خافت
  );

  // أزرار و Call To Action
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.offWhite, // نص فاتح فوق أزرار برتقالية
  );

  // نصوص مميزة
  static const TextStyle accent = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.softOrange, // برتقالي ناعم مميز
  );
}
