import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_api/page/detail/detail_page.dart';
import 'package:store_api/page/home/home_page.dart';
import 'package:store_api/page/welcome/welcome_page.dart';
import 'package:store_api/repos/store_repo.dart';

import 'model/data.dart';
import 'page/cart/ui/cart_page.dart';
import 'page/store/ui/store_page.dart';
import 'page/welcome/login/ui/login_page.dart';
import 'page/welcome/register/register_page.dart';

class MyRouteGenerator {
  Route generateRoute(RouteSettings settings) {
    // final StoreRepo repo = StoreRepo();
    switch (settings.name) {
      case StorePage.id:
        return MaterialPageRoute(builder: (context) => const StorePage());

      case DetailPage.id:
        final DataModel data = settings.arguments as DataModel;
        return MaterialPageRoute(builder: (context) => DetailPage(data: data));

      case HomePage.id:
        return MaterialPageRoute(
            builder:
                // (context) =>
                //     BlocProvider.value(value: repo, child: const HomePage()));

                (context) => const HomePage());

      case CartPage.id:
        return MaterialPageRoute(builder: (context) => const CartPage());

      case RegistrationPage.id:
        return MaterialPageRoute(
            builder: (context) => const RegistrationPage());

      case LoginPage.id:
        return MaterialPageRoute(builder: (context) => LoginPage());

      case WelcomePage.id:
        return MaterialPageRoute(builder: (context) => const WelcomePage());

      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }
}
