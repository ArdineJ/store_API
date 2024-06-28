import 'package:flutter/material.dart';
import 'package:store_api/components/icon_btn.dart';
import 'package:store_api/model/data.dart';

class DetailPage extends StatelessWidget {
  final DataModel data;

  const DetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  static const String id = "detail_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        leading: MyIconButton(
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          MyIconButton(
            icon: Icons.share,
            // onTap: () => Share.share('TOLONG'),
          ),
          MyIconButton(
            icon: Icons.shopping_cart_outlined,
            onTap: () => Navigator.pushNamed(context, 'cart_page'),
          ),
          MyIconButton(
            icon: Icons.more_vert_rounded,
            // onTap: () => Navigator.pushNamed(context, 'home_page'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data.image),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${data.price}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '⭐ ${data.rating.rate} / 5',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '|',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${data.rating.count} Sold',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Text(data.category.toString().split('.').last),
                  // Text(EnumToString.convertToString(data.category)),
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    data.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        // color: Colors.grey,
        height: 60,
        // notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.white, // Color for the first IconButton
                child: IconButton(
                  icon: Icon(Icons.message_outlined),
                  onPressed: () {},
                ),
              ),
              Container(
                // color: Colors.white, // Color for the second IconButton
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart_rounded),
                  onPressed: () {},
                ),
              ),
              Container(
                height: double.infinity,
                decoration: BoxDecoration(color: Colors.amber),
                // color: Colors.amber, // Color for the "Buy Now" button
                child: Center(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   shape: CircleBorder(),
      // ),
      // bottomSheet: Container(
      //   decoration: BoxDecoration(color: Colors.transparent),
      //   padding: EdgeInsets.all(16),
      //   child: ElevatedButton(
      //     onPressed: () {
      //       // Implement the add to cart functionality here
      //       // For example, you can call a function to add the product to the cart
      //       // addToCart(context, data);
      //     },
      //     child: Text('Add to Cart'),
      //   ),
      // ),
    );
  }
}
