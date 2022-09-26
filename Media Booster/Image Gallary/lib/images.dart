class Store {
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final String category;
  final String image;
  final List images;

  Store({
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.category,
    required this.image,
    required this.images,
  });
  factory Store.fromJSON(Map json) {
    return Store(
      crossAxisCellCount: json["crossAxisCellCount"],
      mainAxisCellCount: json["mainAxisCellCount"],
      category: json["category"],
      image: json["image"],
      images: json["images"],
    );
  }
}
