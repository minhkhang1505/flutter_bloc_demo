import 'package:bloc_demo/data/mock_data_local.dart';
import 'package:bloc_demo/data/model/food_model.dart';

abstract class FoodRepository {
  Future<List<Food>> getFoodData();
  Future<List<Food>> clearData();
}

class FoodRepositoryImpl implements FoodRepository {
  FoodRepositoryImpl();

  @override
  Future<List<Food>> getFoodData() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    // Return mock data
    return mockFoodData;
  }

  @override
  Future<List<Food>> clearData() async {
    // Simulate clearing data delay
    await Future.delayed(const Duration(seconds: 1));
    // In a real implementation, this would clear data from a database or API
    return [];
  }
}
