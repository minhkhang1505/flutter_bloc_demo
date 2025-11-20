import 'package:bloc_demo/data/model/food_model.dart';

abstract class HomeState {}

class FoodDataState extends HomeState {
  final List<FoodModel> foodItems;

  FoodDataState(this.foodItems);
}

class HomeLoadingState extends HomeState {
  final bool isLoading;

  HomeLoadingState(this.isLoading);
}
