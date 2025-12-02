import 'package:flutter/material.dart';
import 'package:mk_stationery/features/home/ui/views/profile/widgets/menu_item.dart';

class ProfileMenuBody extends StatelessWidget {
  const ProfileMenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          icon: Icons.person_outline,
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
          onTap: () {},
        ),

        const Divider(height: 1),
        MenuItem(
          icon: Icons.shopping_bag_outlined,
          title: 'My Orders',
          subtitle: 'Track and manage your orders',
          onTap: () => () {},
        ),
        const Divider(height: 1),
        MenuItem(
          icon: Icons.favorite_outline,
          title: 'Wishlist',
          subtitle: 'View your saved items',
          onTap: () => () {},
        ),
      ],
    );
  }
}
