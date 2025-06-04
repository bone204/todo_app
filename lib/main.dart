import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo_app/blocs/todo_bloc/todo_event.dart';
import 'package:todo_app/core/services/share_preferences_service.dart';
import 'package:todo_app/data/todo_repository.dart';
import 'package:todo_app/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => SharedPrefsService()),
        RepositoryProvider(create: (context) => TodoRepository(context.read<SharedPrefsService>())),
      ],
      child: BlocProvider(
        create: (context) => TodoBloc(context.read<TodoRepository>())..add(LoadTodos()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const HomeView(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
