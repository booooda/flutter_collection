class ClothesModel {
  final String title;
  final String imageName;
  final double price;
  ClothesModel(
    this.title,
    this.imageName,
    this.price,
  );
}

List<ClothesModel> dataList = [
  ClothesModel(
    "Black Coat",
    "assets/img/climp_scroll/1.png",
    200,
  ),
  ClothesModel("Formal Coat", "assets/img/climp_scroll/2.png", 250),
  ClothesModel("Bink Coat", "assets/img/climp_scroll/3.png", 150),
  ClothesModel("Winter Jacket", "assets/img/climp_scroll/4.png", 400),
];
