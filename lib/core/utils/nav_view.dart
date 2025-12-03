import 'package:flutter/material.dart';
import 'package:mk_stationery/core/utils/nav_bar_controller.dart';
import 'package:mk_stationery/features/cart/ui/views/cart_view.dart';
import 'package:mk_stationery/features/home/ui/views/home/home_screen.dart';
import 'package:mk_stationery/features/home/ui/views/favorites/favorites_view.dart';
import 'package:mk_stationery/features/home/ui/views/profile/profile_view.dart';
import 'package:mk_stationery/features/home/ui/views/home/widgets/nav_bar.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  final NavBarController navController = NavBarController();
  final GlobalKey<FavouritesViewState> favouritesKey =
      GlobalKey<FavouritesViewState>();
  int previousIndex = 0;

  @override
  void dispose() {
    navController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    navController.addListener(onNavIndexChanged);
  }

  void onNavIndexChanged() {
    int currentIndex = navController.currentIndex;

    if (currentIndex == 1 && previousIndex != 1) {
      favouritesKey.currentState?.refreshFavourites();
    }

    previousIndex = currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: navController,
        builder: (context, child) {
          return IndexedStack(
            index: navController.currentIndex,
            children: getScreens(),
          );
        },
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: navController,
        builder: (context, child) {
          return BottomNavBar(
            currentIndex: navController.currentIndex,
            onTabChange: (index) {
              navController.updateIndex(index);
            },
          );
        },
      ),
    );
  }

  List<Widget> getScreens() {
    return [
      const HomeScreen(),
      FavouritesView(key: favouritesKey, navController: navController),
      const CartView(),
      const ProfileView(),
    ];
  }
}
