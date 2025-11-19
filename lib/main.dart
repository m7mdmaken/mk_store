import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mk_stationery/core/di/get_it.dart';
import 'package:mk_stationery/core/helpers/shared_preferences_helper.dart';
import 'package:mk_stationery/core/routing/app_router.dart';
import 'package:mk_stationery/mk_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefsHelper.init();
  initGetIt();
  runApp(MKSTATIONARY(appRouter: AppRouter()));
}
