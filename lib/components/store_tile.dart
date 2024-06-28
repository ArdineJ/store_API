// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:store_api/model/data.dart';

class StoreTile extends StatelessWidget {
  DataModel data;
  void Function()? onTapDetail;
  StoreTile({
    Key? key,
    required this.data,
    this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapDetail,
      borderRadius: BorderRadius.circular(20),
      child: Expanded(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                data.image,
                width: 170,
                height: 170,
              ),
              Flexible(
                child: Text(
                  data.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                '\$${data.price.toString()}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(2),
              //   decoration:
              //       BoxDecoration(border: Border.all(color: Colors.red)),
              //   child: Text(
              //     data.category.name.toString(),
              //     style: const TextStyle(
              //         color: Colors.red, fontWeight: FontWeight.w500),
              //   ),
              // ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  Text(
                    data.rating.rate.toString(),
                  ),
                  const Text(
                    '  |  ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    // style: TextStyle(),
                  ),
                  Text('${data.rating.count} Sold'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
