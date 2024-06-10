import 'package:flutter/material.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 260,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            child: Text(
              "Check Out",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              "\$0.0",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
