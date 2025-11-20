import 'package:bloc_demo/presentation/home/bloc/home_event.dart';
import 'package:bloc_demo/presentation/home/bloc/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingState()) {
    on<GetData>((event, emit) {
      emit(LoadingState());

      emit(SuccessState());
    });
  }
}
