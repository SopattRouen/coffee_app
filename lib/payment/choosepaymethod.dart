import 'package:coffee_test_1/payment/card_visa.dart';
import 'package:coffee_test_1/payment/qrcode.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int isClick = 0;
  @override
  void initState() {
    super.initState;
    isClick = 1;
  }

  setisClick(int val) {
    setState(() {
      isClick = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image(
                      image: AssetImage(
                        "images/master.png",
                      ),
                      height: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Master Card",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Radio(
                value: 1,
                groupValue: isClick,
                onChanged: (value) {
                  setisClick(value!);
                },
              ),
            ],
          ),
        ),
        Container(
          width: 400,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image(
                      height: 50,
                      image: AssetImage(
                        "images/ace.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "QR Code",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Radio(
                value: 2,
                groupValue: isClick,
                onChanged: (value) {
                  setisClick(value!);
                },
              ),
            ],
          ),
        ),
        if (isClick == 1) VisaCardWidget(),
        if (isClick == 2) QRCode(),
        BottomAppBar(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Pay Now",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
