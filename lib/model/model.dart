class Model {
  final String title;
  final String image;
  final double price;
  final String des;

  Model({
    required this.title,
    required this.image,
    required this.price,
    required this.des,
  });
  static List<Model> model = [
    Model(
      title: "cappucino",
      image: "images/cappucino.jpg",
      price: 10.2,
      des: "Take some test from our \nnew candidate of cappucino\n",
    ),
    Model(
      title: "green tea",
      image: "images/greentea.jpg",
      price: 2,
      des: "Newest item for make some cool\n like test our green tea ",
    ),
    Model(
      title: "hot coffee",
      image: "images/hotcoffee.jpg",
      price: 1.5,
      des: "Hot coffee is the best test for\nanybody",
    ),
    Model(
      title: "ice latte",
      image: "images/icelatte.jpg",
      price: 2,
      des: "Ice choice ice latte\n you should try this one   ",
    ),
    Model(
      title: "mango coffee",
      image: "images/mangocoffee.jpg",
      price: 5,
      des: "First creation and espacially for you",
    ),
    Model(
      title: "matcha soda",
      image: "images/matchasoda.jpg",
      price: 1.5,
      des: "Book now if you need some \nfresh and take a new test",
    ),
    Model(
      title: "Blue Lagoon",
      image: "images/bluelagoon.jpg",
      price: 2.5,
      des: "Book now to get new task",
    ),
    Model(
      title: "Cream Soda",
      image: "images/creamsoda.jpg",
      price: 1.5,
      des: "Our new item",
    ),
    Model(
      title: "Ice Coffee",
      image: "images/icecoffee.jpg",
      price: 1.5,
      des: "Can't wait for it",
    ),
    Model(
      title: "Lemon Soda",
      image: "images/lemonsoda.jpg",
      price: 1.5,
      des: "Lemon Soda like an \nangel task for everyone",
    ),
    Model(
      title: "Passion Soda",
      image: "images/passionsoda.jpg",
      price: 2,
      des: "The best for you please test\n it now",
    ),
  ];
}
