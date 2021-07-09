class Product {
  List<ProductModel> listProduct = [
    ProductModel(
      "Iphone",
      "1000",
      "iPhone is the stylist phone ever",
      "assets/iphone.jpg",
    ),
    ProductModel(
      "Pixel",
      "800",
      "Pixel is the most featureful phone ever",
      "assets/pixel.jpg",
    ),
    ProductModel(
      "Laptop",
      "5200",
      "Laptop is most productive development tool",
      "assets/laptop.jpg",
    ),
    ProductModel(
      "Tablet",
      "1500",
      "Tablet is the most useful device ever for meeting",
      "assets/tablet.jpg",
    ),
    ProductModel(
      "Pendrive",
      "100",
      "Pendrive is useful storage medium",
      "assets/pendrive.jpg",
    ),
    ProductModel(
      "Floppy drive",
      "20",
      "Floppy drive is useful rescue storage medium",
      "assets/floppy.jpg",
    ),
  ];
}

class ProductModel {
  String name;
  String price;
  String description;
  String image;

  ProductModel(this.name, this.price, this.description, this.image);
}
