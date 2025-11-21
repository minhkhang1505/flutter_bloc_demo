import 'package:bloc_demo/data/mock/mock_data_local.dart';
import 'package:bloc_demo/data/model/food_model.dart';

abstract class FoodRepository {
  Future<List<Food>> getFoodData();
  // Future<List<Food>> clearData();
}

class FoodRepositoryImpl implements FoodRepository {
  bool _shouldFail = true;

  @override
  Future<List<Food>> getFoodData() async {
    await Future.delayed(const Duration(seconds: 2));
    _shouldFail = !_shouldFail; // Toggle status each call

    if (_shouldFail) {
      throw Exception('Failed to load food data');
    } else {
      return mockFoodData;
    }
  }

  // @override
  // Future<List<Food>> clearData() async {
  //   await Future.delayed(const Duration(seconds: 1));

  //   return [];
  // }
}
