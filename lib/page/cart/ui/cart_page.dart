import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_api/components/cart_tile.dart';
import 'package:store_api/model/data.dart';
import 'package:store_api/page/cart/bloc/cart_bloc.dart';
import 'package:store_api/page/detail/detail_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static const String id = "cart_page";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(FetchCartEvent());
    super.initState();
  }

  void onTapDetail(DataModel dataModel) =>
      Navigator.pushNamed(context, DetailPage.id, arguments: dataModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          const Text(
            'Edit',
            style: TextStyle(fontSize: 16),
          ),
          IconButton(
            icon: const Icon(Icons.chat_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        builder: (context, state) {
          switch (state.status) {
            case CartStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CartStatus.success:
              List<DataModel>? products = cartBloc.state.data;
              return CartTile(
                products: products,
                onTapDetail: () => onTapDetail(products as DataModel),
                // onSelect: true,
              );
            default:
              return const Center(
                child: Text(
                  'Your Cart is Empty',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                  ),
                ),
              );
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
