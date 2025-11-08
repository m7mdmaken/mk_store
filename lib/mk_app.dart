import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mk_stationery/core/routing/routes_consts.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';
import '/core/routing/app_router.dart';

class MKSTATIONARY extends StatelessWidget {
  const MKSTATIONARY({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      child: MaterialApp(
        onGenerateRoute: appRouter.onGenerateRoute,
        initialRoute: RoutesConsts.onBoardingScreen,
        debugShowCheckedModeBanner: false,
        title: 'First Method',
        // You can use the library anywhere in the app even in theme
        theme: ThemeData(
          primaryColor: ColorsManager.primary,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
