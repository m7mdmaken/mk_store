import 'package:flutter/material.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.backgroundImg,
  });
  final Widget title;
  final String subTitle;
  final Widget image;
  final Widget backgroundImg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            backgroundImg,
            Positioned(bottom: 0, left: 0, right: 0, child: image),
          ],
        ),

        SizedBox(height: 30),
        title,

        SizedBox(height: 30),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.headline,
        ),
      ],
    );
  }
}
