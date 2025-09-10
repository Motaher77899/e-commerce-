class FashionCategory {
  final String image;
  final String name;
  final String price;
  bool isWishlisted;

  FashionCategory(
      {required this.image,
      required this.name,
      required this.price,
      this.isWishlisted = false});
}

class AppImages {

  static final List<FashionCategory> fashionCategories = [
    // Mobiles.......
    FashionCategory(
        image: "assets/mobiles/IMG_3163.JPG",
        name: "Iphone 15",
        price: "\$120000"),
    FashionCategory(
        image: "assets/mobiles/IMG_3165.JPG",
        name: "Iphone 15 pro",
        price: "\$120000"),
    FashionCategory(
        image: "assets/mobiles/IMG_3166.JPG",
        name: "Samsung-Galaxy",
        price: "\$5590"),
    FashionCategory(
        image: "assets/mobiles/IMG_3167.JPG",
        name: "Iphone 15 pro max",
        price: "\$25000"),
    FashionCategory(
        image: "assets/mobiles/IMG_3168.JPG",
        name: "Samsung",
        price: "\$23520"),
    FashionCategory(
        image: "assets/mobiles/IMG_3169.JPG",
        name: "Samsung",
        price: "\$22220"),
    FashionCategory(
        image: "assets/mobiles/IMG_3170.JPG",
        name: "Honor",
        price: "\$45000"),
    FashionCategory(
        image: "assets/mobiles/IMG_3171.JPG",
        name: "Vivo V50",
        price: "\$26000"),
  ];
}