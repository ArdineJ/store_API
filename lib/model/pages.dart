import 'package:flutter/material.dart';
import 'package:store_api/page/cart/ui/cart_page.dart';
import 'package:store_api/page/profile/profile_page.dart';
import 'package:store_api/page/store/ui/store_page.dart';

final List<Widget> pages = [
  const StorePage(),
  const CartPage(),
  const ProfilePage(),
];
