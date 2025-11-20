import 'package:bloc_demo/presentation/home/bloc/home_bloc.dart';
import 'package:bloc_demo/presentation/home/bloc/home_state.dart';
import 'package:bloc_demo/presentation/home/bloc/home_event.dart';
import 'package:bloc_demo/presentation/home/widgets/empty_state_widget.dart';
import 'package:bloc_demo/presentation/home/widgets/fail_state.dart';
import 'package:bloc_demo/presentation/home/widgets/food_list_widget.dart';
import 'package:bloc_demo/presentation/home/widgets/action_button.dart';
import 'package:bloc_demo/presentation/home/widgets/loading_indicator_state.dart';
import 'package:bloc_demo/presentation/home/widgets/success_state.dart';
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
              FoodStatus.loading => const LoadingIndicatorState(),
              FoodStatus.success => SuccessState(state: state),
              FoodStatus.failure => const FailState(),
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
