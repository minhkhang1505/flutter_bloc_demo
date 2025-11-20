import 'package:bloc_demo/presentation/home/bloc/home_bloc.dart';
import 'package:bloc_demo/presentation/home/bloc/home_state.dart';
import 'package:bloc_demo/presentation/home/bloc/home_event.dart';
import 'package:bloc_demo/presentation/home/widgets/empty_state_widget.dart';
import 'package:bloc_demo/presentation/home/widgets/food_list_widget.dart';
import 'package:bloc_demo/presentation/home/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('BloC Demo'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),

          body: SafeArea(
            child:
                state.status == FoodStatus.initial ||
                    (state.status == FoodStatus.success &&
                        state.foodItems.isEmpty)
                ? const EmptyStateWidget()
                : state.status == FoodStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : state.status == FoodStatus.success &&
                      state.foodItems.isNotEmpty
                ? FoodListWidget(items: state.foodItems)
                : state.status == FoodStatus.failure
                ? const Center(child: Text('Failed to load data'))
                : const SizedBox.shrink(),
          ),

          bottomNavigationBar: ActionButton(
            hasData: state.foodItems.isNotEmpty,
            onPressed: () {
              if (state.foodItems.isNotEmpty) {
                homeBloc.add(ClearData());
              } else {
                homeBloc.add(GetData());
              }
            },
          ),
        );
      },
    );
  }
}
