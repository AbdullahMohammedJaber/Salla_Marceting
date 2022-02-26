class Product {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String productCategoryName;
  final int quantity;
  final bool isFavorite;
  final bool isPopular;
  final String descreption;

  Product(
      {this.id,
      this.descreption,
      this.title,
      this.price,
      this.imageUrl,
      this.productCategoryName,
      this.quantity,
      this.isFavorite,
      this.isPopular});
}
