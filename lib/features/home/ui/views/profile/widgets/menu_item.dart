import 'package:flutter/material.dart';
import 'package:mk_stationery/core/theming/color_manager.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Icon(icon, color: ColorsManager.primary, size: 24),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorsManager.textDark,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
