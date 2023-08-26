class Food {
  String name;
  String price;
  String imagePath;
  String rating;

  // Constructor for creating a Food object
  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

  // Getters for accessing private properties outside the class
  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
}
