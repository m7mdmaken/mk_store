import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mk_stationery/core/theming/assets.gen.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';
import 'package:mk_stationery/features/on_boarding/ui/widgets/page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    // final localizations = AppLocalizations.of(context)!;

    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: Assets.svgs.onboarding1.svg(),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: r' welcome to ', style: AppTextStyles.headline),
                TextSpan(text: 'MK', style: AppTextStyles.headline),
                TextSpan(text: 'Stationery', style: AppTextStyles.headline),
              ],
            ),
          ),
          subTitle: "where you can find everything you need",
          backgroundImg: SizedBox(
            width: double.infinity,
            child: Assets.svgs.onboardingShadow.svg(
              fit: BoxFit.fill,
              height: 500.h,
            ),
          ),
        ),
        PageViewItem(
          image: Assets.svgs.onboarding3.svg(),
          title: Text("this is 2", style: AppTextStyles.headline),
          subTitle: "hi",
          backgroundImg: SizedBox(
            width: double.infinity,
            child: Assets.svgs.onboardingShadow1.svg(
              fit: BoxFit.fill,
              height: 450.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFFC8EFD8),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        PageViewItem(
          image: Assets.svgs.onboarding2.svg(),
          title: Text("fast delivery", style: AppTextStyles.headline),
          subTitle:
              "Get your products delivered to your doorstep quickly and efficiently.",
          backgroundImg: SizedBox(
            width: double.infinity,
            child: Assets.svgs.onboardingShadowSolid.svg(
              fit: BoxFit.fill,
              height: 397.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFFC8EFD8),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
