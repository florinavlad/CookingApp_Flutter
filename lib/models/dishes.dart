class Dish {
  final String id, title, subTitle, image;

  Dish(
      {required this.id,
      required this.title,
      required this.image,
      required this.subTitle});

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      subTitle: json["subTitle"],
    );
  }
}

Dish dish = Dish(
  id: "1",
  title: "Sandwich Broccoli",
  image: "https://i.imgur.com/Fq4sbQC.png",
  subTitle: "Breakfast",
);
