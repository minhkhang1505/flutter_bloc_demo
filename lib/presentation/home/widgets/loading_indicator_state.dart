import 'package:flutter/material.dart';

class LoadingIndicatorState extends StatelessWidget {
  const LoadingIndicatorState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
