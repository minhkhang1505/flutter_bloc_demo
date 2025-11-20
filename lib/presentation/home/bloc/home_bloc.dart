import 'package:bloc/bloc.dart';
import 'package:bloc_demo/presentation/home/bloc/home_event.dart';
import 'package:bloc_demo/presentation/home/bloc/home_state.dart';
import 'package:bloc_demo/data/mock_data_local.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(FoodDataState([])) {
    on<GetData>((event, emit) async {
      emit(HomeLoadingState(true));
      await Future.delayed(const Duration(seconds: 2));
      emit(FoodDataState(mockFoodData));
    });

    on<ClearData>((event, emit) {
      emit(FoodDataState([]));
    });
  }

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    print(transition);
    super.onTransition(transition);
  }
}
