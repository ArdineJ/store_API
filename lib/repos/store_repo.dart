import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:store_api/model/cart.dart';

import '../model/data.dart';

var client = http.Client();
var uri = 'https://fakestoreapi.com';

class StoreRepo {
  static Future<List<DataModel>> fetchStoreData(String? queryData) async {
    try {
      http.Response response;
      List<DataModel> storeData = [];

      if (queryData == null) {
        response = await client.get(
          Uri.parse('$uri/products'),
        );
      } else {
        response = await client.get(
          Uri.parse('$uri/products/category/$queryData'),
        );
      }

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        DataModel store = DataModel.fromMap(result[i] as Map<String, dynamic>);

        storeData.add(store);
      }
      return storeData;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<List<DataModel>> fetchCartProducts() async {
    try {
      List<int> productIds = await fetchCartProductIds(); // [1,9]
      List<DataModel> cartProducts = [];

      for (int productId in productIds) {
        DataModel product = await fetchProductById(productId);
        cartProducts.add(product);
      }

      return cartProducts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<List<int>> fetchCartProductIds() async {
    try {
      http.Response response;

      response = await client.get(
        Uri.parse('$uri/carts/user/2'),
      );

      List result = jsonDecode(response.body);
      List<int> productIds = [];
      for (int i = 0; i < result.length; i++) {
        Map<String, dynamic> cartItem = result[i] as Map<String, dynamic>;
        for (var product in cartItem['products']) {
          productIds.add(product['productId']);
        }
      }
      return productIds;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<DataModel> fetchProductById(int productId) async {
    try {
      http.Response response = await client.get(
        Uri.parse('$uri/products/$productId'),
      );

      Map<String, dynamic> productJson = jsonDecode(response.body);
      return DataModel.fromMap(productJson);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch product with ID $productId');
    }
  }
}
