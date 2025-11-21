import 'package:bloc_demo/presentation/home/bloc/home_state.dart';
import 'package:bloc_demo/presentation/home/widgets/food_item_list.dart';
import 'package:flutter/material.dart';

class SuccessState extends StatelessWidget {
  final HomeState state;
  const SuccessState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return FoodItemList(items: state.foodItems);
  }
}
