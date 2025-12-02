import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChange;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.grey,
          activeColor: Theme.of(context).primaryColor,
          tabBackgroundColor: Theme.of(
            context,
          ).primaryColor.withValues(alpha: .1),
          padding: const EdgeInsets.all(16),
          gap: 8,
          selectedIndex: currentIndex,
          onTabChange: onTabChange,
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.favorite, text: 'Favorites'),
            GButton(icon: Icons.shopping_cart, text: 'Cart'),
            GButton(icon: Icons.person, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
