import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No items available',
        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
      ),
    );
  }
}
