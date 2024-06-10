import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:coffee_test_1/model/model.dart';
import 'package:coffee_test_1/widget.dart/productdetial.dart';

import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  ProductWidget({
    super.key,
  });
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isClick = true;
  // final addCart = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
          mainAxisSpacing: 20,
        ),
        itemCount: Model.model.length,
        itemBuilder: ((context, index) {
          final item = Model.model[index];
          return Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductReusable(
                          pro: item,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("${item.image}"),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${item.title}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\$${item.price}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Ratting(),
                          Icon(Icons.more_vert),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //
            ],
          );
        }),
      ),
    );
  }
}

class Ratting extends StatelessWidget {
  const Ratting({
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
      starSize: 15.0,
      animationDuration: Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      readOnly: false,
    );
  }
}

class ProductReusable extends StatelessWidget {
  const ProductReusable({
    super.key,
    required this.pro,
  });
  final Model pro;
  @override
  Widget build(BuildContext context) {
    return ProductDetailWidget(
      productmodel: pro,
    );
  }
}
