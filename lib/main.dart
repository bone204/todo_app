import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/todo/presentation/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/blocs/todo_bloc/todo_event.dart';
import 'package:todo_app/features/todo/presentation/views/home/home_view.dart';
import 'package:todo_app/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(LoadTodos()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
