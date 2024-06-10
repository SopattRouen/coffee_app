import 'package:coffee_test_1/api/model_rest_api.dart';
import 'package:coffee_test_1/service/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FashionApi extends StatefulWidget {
  FashionApi({super.key});

  @override
  State<FashionApi> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FashionApi> {
  late Future<List<model_rest_api>> res;
  @override
  void initState() {
    res = ServiceApi.getUrl();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: res,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return Center(
              child: Text("No data"),
            );
          }
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text("Data is Empty"),
            );
          }
          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 1,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return Product(
                  pro: product,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Product extends StatefulWidget {
  const Product({super.key, required this.pro});
  final model_rest_api pro;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          elevation: 0,
          child: Image(
            height: 120,
            image: NetworkImage(
              "${widget.pro.image}",
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                "${widget.pro.title}",
                style: TextStyle(fontSize: 12),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "\$${widget.pro.price}",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.amber,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
