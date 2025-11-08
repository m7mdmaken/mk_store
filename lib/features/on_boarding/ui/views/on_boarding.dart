import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mk_stationery/core/constants.dart';
import 'package:mk_stationery/core/helpers/extentions.dart';
import 'package:mk_stationery/core/helpers/shared_preferences_helper.dart';
import 'package:mk_stationery/core/routing/routes_consts.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';
import 'package:mk_stationery/core/widgets/app_text_button.dart';
import 'package:mk_stationery/features/on_boarding/ui/widgets/onboarding_page_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: OnboardingPageView(pageController: pageController)),
          CustomDotsIndicator(currentPage: currentPage),
          SizedBox(height: 26),
          currentPage == 0 || currentPage == 1
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: AppTextButton(
                  buttonText: "Next",
                  textStyle: AppTextStyles.button,
                  onPressed: () {
                    setState(() {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    });
                  },
                ),
                // CustomButton(
                //   text: 'ابدا الان',
                //   onTap: () {
                //     CacheHelper.saveData(key: kOnBoardingKey, value: true);
                //     context.pushReplacementNamed(RoutesConsts.loginScreen);
                //   },
                // ),
              )
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextButton(
                  buttonText: "Get Started",
                  textStyle: AppTextStyles.button,
                  onPressed: () {
                    SharedPrefsHelper.saveData(
                      key: kOnBoardingKey,
                      value: true,
                    );
                    context.pushReplacementNamed(RoutesConsts.loginView);
                  },
                ),
              ),
          SizedBox(height: 26),
        ],
      ),
    );
  }
}

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, required this.currentPage});
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: currentPage.toDouble(),
      decorator: DotsDecorator(
        activeColor: Colors.black,
        color: const Color(0xFFC4C4C4),
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        spacing: const EdgeInsets.all(4.0),
      ),
    );
  }
}
