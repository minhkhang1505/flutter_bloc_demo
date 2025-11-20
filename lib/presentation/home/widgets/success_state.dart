import 'package:bloc_demo/presentation/home/bloc/home_state.dart';
import 'package:bloc_demo/presentation/home/widgets/empty_state_widget.dart';
import 'package:bloc_demo/presentation/home/widgets/food_list_widget.dart';
import 'package:flutter/material.dart';

class SuccessState extends StatelessWidget {
  final HomeState state;
  const SuccessState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.foodItems.isEmpty
        ? const EmptyStateWidget()
        : FoodListWidget(items: state.foodItems);
  }
}
