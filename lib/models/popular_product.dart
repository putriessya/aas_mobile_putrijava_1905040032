class PopularProduct {
  late int id;
  late String name;
  late String imageUrl;
  late String category;
  late bool isPopular;
  PopularProduct({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    this.isPopular = false,
  });
}
