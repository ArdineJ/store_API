import 'package:flutter/material.dart';
import 'package:store_api/model/pages.dart';
import 'package:store_api/repos/auth_service.dart';
import 'package:store_api/shared_pref/shared_preference.dart';

import '../../components/bottom_bar_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex = 0;
  Future<String?> token = Preferences.getToken();
  Future<bool> isLogin = Preferences.getIsLogin();

  @override
  void initState() {
    super.initState();
    initHomePage();
  }

  void initHomePage() async {
    String? tokenValue = await token;
    bool isLoginValue = await isLogin;

    if (tokenValue != null && isLoginValue) {
      setState(() {
        _selectedIndex = 0;
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, 'welcome_page');
      });
    }
  }

  // @override
  // void initState() {
  //   if (token != null && token!.isNotEmpty && isLogin) {
  //     _selectedIndex = 0;
  //   } else {
  //     Future.delayed(Duration.zero, () {
  //       Navigator.pushReplacementNamed(context, 'welcome_page');
  //     });
  //   }

  //   super.initState();
  // }

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
