import 'package:bloc_demo/presentation/home/bloc/home_bloc.dart';
import 'package:bloc_demo/presentation/home/bloc/home_state.dart';
import 'package:bloc_demo/presentation/home/bloc/home_event.dart';
import 'package:bloc_demo/presentation/home/widgets/empty_item_widget.dart';
import 'package:bloc_demo/presentation/home/widgets/fail_state.dart';
import 'package:bloc_demo/presentation/home/widgets/failure_load_data_widget.dart';
import 'package:bloc_demo/presentation/home/widgets/food_item_list.dart';
import 'package:bloc_demo/presentation/home/widgets/load_data_button.dart';
import 'package:bloc_demo/presentation/home/widgets/loading_indicator_widget.dart';
import 'package:bloc_demo/presentation/home/widgets/success_widget.dart';
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
              FoodStatus.initial => const EmptyItemWidget(),
              FoodStatus.loading => const LoadingIndicatorWidget(),
              FoodStatus.success => SuccessWidget(listItems: state.foodItems),
              FoodStatus.failure => const FailureWidget(),
            },
          ),

          bottomNavigationBar: SafeArea(
            child: LoadDataButton(
              hasData: state.status != FoodStatus.failure,
              onPressed: () => homeBloc.add(GetData()),
            ),
          ),
        );
      },
    );
  }
}
