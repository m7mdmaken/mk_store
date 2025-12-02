import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key, required this.currentUser});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: ColorsManager.primary,
            child: Text(
              (currentUser.displayName != null &&
                      currentUser.displayName!.isNotEmpty)
                  ? currentUser.displayName![0].toUpperCase()
                  : 'U',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            currentUser.displayName ?? 'No Name',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorsManager.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            currentUser.email ?? 'No Email',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
