import 'package:flutter/material.dart';
import 'package:mk_stationery/core/utils/nav_bar_controller.dart';
import 'package:mk_stationery/features/home/ui/views/home/home_screen.dart';
import 'package:mk_stationery/features/home/ui/views/profile/profile_view.dart';
import 'package:mk_stationery/features/home/ui/views/home/widgets/nav_bar.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  final NavBarController _navController = NavBarController();

  @override
  void dispose() {
    _navController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: _navController,
        builder: (context, child) {
          return IndexedStack(
            index: _navController.currentIndex,
            children: _getScreens(),
          );
        },
      ),

      bottomNavigationBar: ListenableBuilder(
        listenable: _navController,
        builder: (context, child) {
          return BottomNavBar(
            currentIndex: _navController.currentIndex,
            onTabChange: (index) {
              _navController.updateIndex(index);
            },
          );
        },
      ),
    );
  }

  List<Widget> _getScreens() {
    return [
      const HomeScreen(),

      const SizedBox(),

      const SizedBox(),

      const ProfileView(),
    ];
  }
}
