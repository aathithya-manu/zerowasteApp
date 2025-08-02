import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, size: 48, color: Colors.grey[700]),
          const SizedBox(height: 16),
          const Text(
            "No Recipes Found",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            "Try removing an ingredient filter.",
            style: TextStyle(color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}