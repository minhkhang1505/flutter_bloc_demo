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
            child: switch (state) {
              HomeLoadingState(:final isLoading) =>
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox.shrink(),
              FoodDataState(:final foodItems) =>
                foodItems.isEmpty
                    ? const EmptyStateWidget()
                    : FoodListWidget(items: foodItems),
              _ => const SizedBox.shrink(),
            },
          ),

          bottomNavigationBar: ActionButton(
            hasData: state is FoodDataState && state.foodItems.isNotEmpty,
            onPressed: () {
              if (state is FoodDataState && state.foodItems.isNotEmpty) {
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
