import 'package:bloc_demo/data/model/food_model.dart';
import 'package:equatable/equatable.dart';

enum FoodStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final FoodStatus status;
  final List<Food> foodItems;

  const HomeState({
    this.status = FoodStatus.initial,
    this.foodItems = const [],
  });

  HomeState copyWith({FoodStatus? status, List<Food>? foodItems}) {
    return HomeState(
      status: status ?? this.status,
      foodItems: foodItems ?? this.foodItems,
    );
  }

  @override
  List<Object> get props => [status, foodItems];
}
