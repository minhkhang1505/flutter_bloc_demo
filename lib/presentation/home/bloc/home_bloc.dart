import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/repository/food_repository.dart';
import 'package:bloc_demo/presentation/home/bloc/home_event.dart';
import 'package:bloc_demo/presentation/home/bloc/home_state.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FoodRepository foodRepository;

  HomeBloc(this.foodRepository) : super(HomeState()) {
    on<GetData>((event, emit) => _handleGetData(event, emit));

    on<ClearData>((event, emit) => _handleClearData(event, emit));
  }

  Future<void> _handleGetData(GetData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: FoodStatus.loading));

    try {
      final foodItems = await foodRepository.getFoodData();

      emit(state.copyWith(status: FoodStatus.success, foodItems: foodItems));
    } catch (e) {
      // Handle exception - emit failure state
      emit(state.copyWith(status: FoodStatus.failure, foodItems: []));
    }
  }

  Future<void> _handleClearData(
    ClearData event,
    Emitter<HomeState> emit,
  ) async {
    final clearItems = await foodRepository.clearData();

    if (clearItems.isEmpty) {
      emit(state.copyWith(status: FoodStatus.success, foodItems: clearItems));
    } else {
      emit(state.copyWith(status: FoodStatus.failure));
    }
  }

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    debugPrint(
      "Event: ${transition.event} \n Current State: ${transition.currentState} \n Next State: ${transition.nextState}",
    );
    super.onTransition(transition);
  }
}
