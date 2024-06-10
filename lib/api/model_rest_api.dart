class model_rest_api {
  final int? id;
  final String? title;
  final dynamic price;
  final String? description;
  final String? category;
  final String image;
  // Rating? rating;

  model_rest_api({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    required this.image,
    // this.rating
  });

  factory model_rest_api.fromJson(Map<String, dynamic> json) {
    return model_rest_api(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      // rating: json['rating'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['price'] = this.price;
  //   data['description'] = this.description;
  //   data['category'] = this.category;
  //   data['image'] = this.image;
  //   return data;
  // }
}

// class Rating {
//   double? rate;
//   int? count;

//   Rating({this.rate, this.count});
// }
