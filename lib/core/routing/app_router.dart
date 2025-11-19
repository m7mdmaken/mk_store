import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_stationery/core/di/get_it.dart';

import 'package:mk_stationery/core/routing/routes_consts.dart';
import 'package:mk_stationery/features/login/logic/login_cubit/login_cubit.dart';
import 'package:mk_stationery/features/login/ui/views/login_view.dart';
import 'package:mk_stationery/features/on_boarding/ui/views/on_boarding.dart';
import 'package:mk_stationery/features/sign_up/logic/cubits/signup_cubit/signup_cubit.dart';
import 'package:mk_stationery/features/sign_up/ui/screens/signup_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConsts.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case RoutesConsts.loginView:
        return _loginScreenWithCubit();
      case RoutesConsts.homeView:
        return MaterialPageRoute(builder: (_) => Text("home"));
      case RoutesConsts.signupView:
        return _signupScreenWithCubit();
      default:
        return null;
    }
  }

  MaterialPageRoute<dynamic> _signupScreenWithCubit() {
    return MaterialPageRoute(
      builder:
          (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
    );
  }

  MaterialPageRoute<dynamic> _loginScreenWithCubit() {
    return MaterialPageRoute(
      builder:
          (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
    );
  }
}
