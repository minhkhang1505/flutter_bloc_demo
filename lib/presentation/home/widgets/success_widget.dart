import 'package:bloc_demo/data/model/food_model.dart';
import 'package:bloc_demo/presentation/home/widgets/food_item_list.dart';
import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  final List<Food> listItems;
  const SuccessWidget({super.key, required this.listItems});

  @override
  Widget build(BuildContext context) {
    return FoodItemList(items: listItems);
  }
}
