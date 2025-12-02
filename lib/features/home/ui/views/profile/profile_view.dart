import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mk_stationery/core/helpers/extentions.dart';

import 'package:mk_stationery/core/routing/routes_consts.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';
import 'package:mk_stationery/core/theming/text_styles.dart';
import 'package:mk_stationery/core/widgets/app_text_button.dart';
import 'package:mk_stationery/features/home/ui/views/profile/widgets/profile_menu_body.dart';
import 'package:mk_stationery/features/home/ui/views/profile/widgets/user_profile_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: ColorsManager.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            UserProfileHeader(currentUser: currentUser!),
            const SizedBox(height: 30),
            _buildProfileMenu(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: ProfileMenuBody(),
          ),
          const SizedBox(height: 30),
          AppTextButton(
            backgroundColor: Colors.red,
            onPressed: () => _showLogoutDialog(context),
            buttonText: 'Logout',
            textStyle: AppTextStyles.button.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();

                  context.pushReplacementNamed(RoutesConsts.loginView);
                },
                child: const Text('Logout'),
              ),
            ],
          ),
    );
  }
}
