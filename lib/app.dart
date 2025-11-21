import 'package:bloc_demo/data/repository/food_repository.dart';
import 'package:bloc_demo/presentation/home/bloc/home_bloc.dart';
import 'package:bloc_demo/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final foodRepository = FoodRepositoryImpl();

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: RepositoryProvider(
        create: (context) => foodRepository,
        child: BlocProvider(
          create: (context) => HomeBloc(foodRepository),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
