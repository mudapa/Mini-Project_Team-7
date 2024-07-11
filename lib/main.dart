import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_team_7/bloc/cart_bloc/cart_bloc.dart';
import 'package:mini_project_team_7/bloc/profile_bloc/profile_bloc.dart';
import 'package:mini_project_team_7/services/repository/profile_repository.dart';

import 'bloc/product_cart_cubit/product_cart_cubit.dart';
import 'pages/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(ProfileRepository()),
        ),
        BlocProvider(
          create: (context) => CartBloc()..add(LoadCartEvent()),
        ),
        BlocProvider(
          create: (context) => ProductCartCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const CartPage(),
        },
      ),
    );
  }
}
