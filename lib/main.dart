import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_team_7/bloc/profile_bloc/profile_bloc.dart';
import 'package:mini_project_team_7/services/repository/profile_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProfileBloc(ProfileRepository()),
          ),
        ],
        child: Container(),
      ),
    );
  }
}
