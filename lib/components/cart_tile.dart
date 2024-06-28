// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:store_api/model/data.dart';

class CartTile extends StatelessWidget {
  final List<DataModel>? products;
  final void Function()? onTapDetail;
  final Function? onSelect;

  const CartTile({
    Key? key,
    this.products,
    this.onTapDetail,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products?.length ?? 0,
      itemBuilder: (context, index) {
        final product = products![index];
        bool isChecked = false;
        return ListTile(
          leading: Checkbox(
            value: isChecked,
            onChanged: (newValue) {
              // onSelect(newValue);
            },
          ),
          title: Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.length > 20
                        ? '${product.title.substring(0, 20)}...'
                        : product.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  // Counter(
                  //   qty: widget.cart.quantity,
                  //   onDecrement: () {
                  //     if (widget.cart.quantity == 1) {
                  //       widget.onQtyChanged(widget.cart.quantity - 1);
                  //       removeItem(widget.cart.sushi);
                  //     }

                  //     if (widget.cart.quantity > 0) {
                  //       widget.onQtyChanged(widget.cart.quantity - 1);
                  //     }
                  //   },
                  //   onIncrement: () {
                  //     widget.onQtyChanged(widget.cart.quantity + 1);
                  //   },
                  // )
                ],
              ),
            ],
          ),
          onTap: onTapDetail,
        );
      },
    );
  }
}
