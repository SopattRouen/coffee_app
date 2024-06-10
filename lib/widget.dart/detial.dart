import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffee_test_1/controller/getxcontroller.dart';
import 'package:coffee_test_1/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetialWidget extends StatefulWidget {
  DetialWidget({super.key, required this.pro});
  final Model pro;
  @override
  State<DetialWidget> createState() => _DetialWidgetState();
}

class _DetialWidgetState extends State<DetialWidget> {
  bool isClick = true;
  final controller = CountController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.pro.title}",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClick = !isClick;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 37, 20, 20),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: isClick
                          ? Icon(
                              Icons.favorite_border,
                              size: 32,
                              color: Colors.amber,
                            )
                          : Icon(
                              Icons.favorite,
                              size: 32,
                              color: Colors.amber,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Column(
              children: [
                Text(
                  "Ratting Our Products",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.amber,
                  ),
                ),
                RattingWidget(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${widget.pro.des}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 70,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.increase();
                        },
                        child: Icon(
                          Icons.add_circle_outline_outlined,
                          size: 32,
                          color: Colors.amber,
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${controller.count}",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.count > 0) {
                            controller.decrease();
                          } else {
                            controller.removeListener(() {
                              controller.increase();
                              // print("${controller.count * widget.pro.price}");
                            });
                          }
                        },
                        child: Icon(
                          CupertinoIcons.minus_circle,
                          size: 32,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if (controller.total(widget.pro).isEqual(0)) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.info,
                        animType: AnimType.rightSlide,
                        title: 'ជម្រាបសួរ!',
                        titleTextStyle: TextStyle(fontSize: 25),
                        desc: 'សូមត្រួតពិនិត្យមើលចំនួននឹងតម្លៃរបស់អ្នក',
                        descTextStyle: TextStyle(fontSize: 23),
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      )..show();
                    } else {
                      Navigator.pushNamed(context, "checkout");
                    }
                  },
                  child: Container(
                    width: 200,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(
                        45,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Oder Now",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Text(
                      "\$${controller.total(widget.pro).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RattingWidget extends StatelessWidget {
  const RattingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedRatingStars(
      initialRating: 3.5,
      minRating: 0.0,
      maxRating: 5.0,
      filledColor: Colors.amber,
      emptyColor: Colors.grey,
      filledIcon: Icons.star,
      halfFilledIcon: Icons.star_half,
      emptyIcon: Icons.star_border,
      onChanged: (double rating) {
        // Handle the rating change here
        var text = Text("${rating}");
        return text;
      },
      displayRatingValue: true,
      interactiveTooltips: true,
      customFilledIcon: Icons.star,
      customHalfFilledIcon: Icons.star_half,
      customEmptyIcon: Icons.star_border,
      starSize: 30.0,
      animationDuration: Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      readOnly: false,
    );
  }
}
