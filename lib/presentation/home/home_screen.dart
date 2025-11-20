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

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        switch (state.status) {
          case FoodStatus.success:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Load data successful')),
            );
            break;
          case FoodStatus.failure:
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Load data failed')));
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('BloC Demo'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),

          body: SafeArea(
            child: switch (state.status) {
              FoodStatus.initial => const EmptyStateWidget(),
              FoodStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),
              FoodStatus.success =>
                state.foodItems.isEmpty
                    ? const EmptyStateWidget()
                    : FoodListWidget(items: state.foodItems),
              FoodStatus.failure => const Center(
                child: Text('Failed to load data'),
              ),
            },
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
