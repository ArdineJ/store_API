import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int qty;
  final Function() onDecrement;
  final Function() onIncrement;

  const Counter({
    required this.qty,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.remove),
              color: Colors.white,
              onPressed: onDecrement,
            ),
          ),
        ),
        SizedBox(
          width: 25,
          child: Center(
            child: Text(
              qty.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.add),
              color: Colors.white,
              onPressed: onIncrement,
            ),
          ),
        )
      ],
    );
  }
}
