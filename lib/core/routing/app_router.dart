import 'package:flutter/material.dart';

import 'package:mk_stationery/core/routing/routes_consts.dart';
import 'package:mk_stationery/features/login/ui/views/login_view.dart';
import 'package:mk_stationery/features/on_boarding/ui/views/on_boarding.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConsts.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case RoutesConsts.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      default:
        return null;
    }
  }
}
