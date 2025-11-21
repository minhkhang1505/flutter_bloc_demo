import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Failed to load data. Please try again.',
        style: TextStyle(fontSize: 16, color: Colors.red),
      ),
    );
  }
}
