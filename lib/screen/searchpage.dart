import 'package:coffee_test_1/model/model.dart';
import 'package:coffee_test_1/screen/cartscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Model> display = List.from(Model.model);
  bool isSearching = false;
  void search(String value) {
    setState(() {
      if (value.isEmpty) {
        // If the search value is empty, don't show any results
        display.clear();
        isSearching = false;
      } else {
        // Filter the models based on the search value
        display = Model.model
            .where((element) =>
                element.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
        isSearching = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 16, 9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 35,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 320,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            size: 26,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 170,
                            height: 60,
                            child: TextField(
                              onChanged: (value) => search(value),
                              decoration: InputDecoration(
                                hintText: "Search...",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isSearching && display.isNotEmpty)
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: display.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: () {
                        Get.to(() => CartScreen());
                      },
                      title: Text(
                        display[index].title,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
