import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBack;

  const TopBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          if (showBack)
            GestureDetector(
              onTap: onBack ?? () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, size: 26),
            ),
          if (showBack) const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
