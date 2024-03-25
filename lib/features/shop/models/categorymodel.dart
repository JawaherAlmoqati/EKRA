// ignore_for_file: file_names

class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});
}

List<CategoryModel> categoryData = [
  CategoryModel(name: "all", image: "assets/images/all.png"),
  CategoryModel(name: "Power Tools ", image: "assets/images/power-drill 1.png"),
  CategoryModel(name: "Excavator", image: "assets/images/Excavator.png"),
  CategoryModel(
      name: "Concrete Mixer", image: "assets/images/Concrete mixer.png"),
  CategoryModel(name: "Bulldozer", image: "assets/images/Bulldozer.png"),
];
