import 'package:flutter/material.dart';

import 'choosepaymethod.dart';

class CreditcardWidget extends StatelessWidget {
  const CreditcardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "images/credit_card.jpg",
                ),
              ),
            ),
          ),
        ),
        PaymentMethod(),
      ],
    );
  }
}
