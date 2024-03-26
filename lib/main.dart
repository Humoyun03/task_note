import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_note/data/local/hive_helper.dart';
import 'package:task_note/features/add_note/bloc/add_bloc.dart';
import 'package:task_note/features/add_note/pages/add_note.dart';
import 'package:task_note/features/complated/bloc/complete_bloc.dart';
import 'package:task_note/features/complated/pages/complete_page.dart';
import 'package:task_note/features/main/bloc/main_bloc.dart';
import 'package:task_note/features/main/pages/main.dart';
import 'package:task_note/features/uncomplated/bloc/uncomplete_bloc.dart';
import 'package:task_note/features/uncomplated/pages/uncomplete_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  MyHiveHelper.init();
  MyHiveHelper.initNoteHive();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'main',
      routes: {
        'main' : (BuildContext context) => BlocProvider(
          create: (BuildContext context) => MainBloc(),
          child: const MainScreen(),
        ),
        'add' : (BuildContext context) => BlocProvider(
          create: (BuildContext context) => AddBloc(),
          child:  AddNoteScreen(),
        ),
        'complete' : (BuildContext context) => BlocProvider(
          create: (BuildContext context) => CompleteBloc(),
          child:  CompletePage(),
        ),
        'unComplete' : (BuildContext context) => BlocProvider(
          create: (BuildContext context) => UnCompleteBloc(),
          child:  UnCompletePage(),
        ),
      },
    );
  }
}

