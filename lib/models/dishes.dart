class Ingredient {
  final String name;
  final String quantity;

  Ingredient({required this.name, required this.quantity});
}

class Dish {
  final int time;
  final String id, title, subTitle, image, nation, description, chef;
  final List<Ingredient> ingredients;

  Dish({
    required this.id,
    required this.title,
    required this.image,
    required this.subTitle,
    required this.nation,
    required this.chef,
    required this.time,
    required this.ingredients,
    required this.description,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredientsList = (json["ingredients"] as List<dynamic>)
        .map((ingredient) => Ingredient(
              name: ingredient["name"],
              quantity: ingredient["quantity"],
            ))
        .toList();
    return Dish(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      subTitle: json["subTitle"],
      nation: json["nation"],
      chef: json["chef"],
      ingredients: ingredientsList,
      time: json["time"],
      description: json["description"],
    );
  }
}

Dish dish = Dish(
  id: "1",
  nation: "French",
  title: "Sandwich Broccoli",
  chef: "Florin Dumitrescu",
  time: 25,
  image: "https://i.imgur.com/Fq4sbQC.png",
  subTitle: "Breakfast",
  ingredients: [
    Ingredient(name: "Chifla", quantity: "1 bucata"),
    Ingredient(name: "Crenvurst", quantity: "1 bucata"),
    Ingredient(name: "Oua", quantity: "2 bucati"),
    Ingredient(name: "Broccoli", quantity: "1 bucata"),
    Ingredient(name: "Muștar", quantity: "1 lingură"),
    Ingredient(name: "Lamaie", quantity: "1 bucata"),
    Ingredient(name: "Ulei masline", quantity: "10 ml"),
    Ingredient(name: "Otet", quantity: "1o ml"),
    Ingredient(name: "Sare", quantity: "5 g"),
  ],
  description: description,
);
String description =
    "Pentru a face ouale posate punem la fiert apa, in care adaugam otet si sare. Astfel, vom pastra ouale intregi in timpul fierberii. Cat fierbe apa, taiem buchetelele de broccoli BIO si le punem in apa rece. Hai sa facem maioneza: intr-un bol punem un galbenus de ou, o lingura de mustar si turnam ulei de floarea-soarelui in fir subtire, in timp ce amestecam energic cu un tel. Adaugam zeama de la o jumatate de lamaie, sare si piper si maioneza este gata. Intr-o tigaie punem la incins putin ulei de masline. Cand s-a incins, tragem la tigaie si buchetelele de broccoli pana se rumenesc.";
