import 'package:flutter/material.dart';
import 'package:bloc_demo/presentation/home/widgets/food_item.dart';
import 'package:bloc_demo/data/model/food_model.dart';

class FoodItemList extends StatelessWidget {
  final List<Food> items;
  const FoodItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: FoodItem(
            title: item.name,
            description: item.description,
            imageUrl: item.imageUrl,
          ),
        );
      },
    );
  }
}
