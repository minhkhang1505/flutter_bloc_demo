import 'package:flutter/material.dart';

class LoadDataButton extends StatelessWidget {
  final bool hasData;
  final VoidCallback onPressed;
  const LoadDataButton({
    super.key,
    required this.hasData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 159, 238),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        child: Text(
          hasData ? 'Load Data' : 'ReLoad Data',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
