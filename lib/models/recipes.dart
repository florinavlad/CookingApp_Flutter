class Ingredient {
  final String name;
  final String quantity;

  Ingredient({required this.name, required this.quantity});
}

class Recipe {
  final int time;
  final String id, nation, title, chef, image, description;
  final List<Ingredient> ingredients;

  Recipe({
    required this.id,
    required this.nation,
    required this.title,
    required this.chef,
    required this.time,
    required this.image,
    required this.ingredients,
    required this.description,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredientsList = (json["ingredients"] as List<dynamic>)
        .map((ingredient) => Ingredient(
              name: ingredient["name"],
              quantity: ingredient["quantity"],
            ))
        .toList();

    return Recipe(
      id: json["id"],
      nation: json["nation"],
      title: json["title"],
      chef: json["chef"],
      ingredients: ingredientsList,
      time: json["time"],
      image: json["image"],
      description: json["description"],
    );
  }
}

// Demo
Recipe recipe = Recipe(
  id: "1",
  nation: "French",
  title: "Sandwich Broccoli",
  chef: "Florin Dumitrescu",
  time: 25,
  image: "https://i.imgur.com/Fq4sbQC.png",
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
