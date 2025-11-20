import 'package:flutter/material.dart';
import 'package:bloc_demo/presentation/home/widgets/item.dart';
import 'package:bloc_demo/data/model/food_model.dart';

class FoodListWidget extends StatelessWidget {
  final List<FoodModel> items;
  const FoodListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Item(
            title: item.name,
            description: item.description,
            imageUrl: item.imageUrl,
          ),
        );
      },
    );
  }
}
