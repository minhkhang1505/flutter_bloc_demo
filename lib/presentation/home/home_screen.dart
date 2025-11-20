import 'package:bloc_demo/data/mock_data_local.dart';
import 'package:bloc_demo/presentation/home/widgets/food_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = mockFoodData;
    return Scaffold(
      appBar: AppBar(title: const Text('BloC Demo')),
      body: SafeArea(
        child: Column(
          children: [Expanded(child: FoodListWidget(items: items))],
        ),
      ),
    );
  }
}
