import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_api/generate_route.dart';
import 'package:store_api/page/cart/ui/cart_page.dart';
import 'package:store_api/page/home/home_page.dart';
import 'package:store_api/page/welcome/welcome_page.dart';

import 'page/store/ui/store_page.dart';
import 'page/welcome/login/bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(), // Initialize your LoginBloc here
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
          useMaterial3: true,
        ),
        initialRoute: HomePage.id,
        onGenerateRoute: MyRouteGenerator().generateRoute,
      ),
    );
  }
}
