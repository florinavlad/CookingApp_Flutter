import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/body.dart';
import 'package:flutter_application_1/models/recipes.dart';

import '../size_config.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetails({
    required Key key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsContainer(
              recipe: recipe,
            ),
            Positioned(
              top: defaultSize * 50,
              left: 0,
              right: 0,
              child: PreparationMode(),
            ),
            Positioned(
              top: defaultSize * 17,
              right: -defaultSize * 9,
              child: Hero(
                tag: recipe.id,
                child: Image.network(
                  recipe.image,
                  height: defaultSize * 50,
                  width: defaultSize * 38,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container PreparationMode() {
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 45),
      padding: EdgeInsets.only(
          top: defaultSize * 2, left: defaultSize * 2, right: defaultSize * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultSize),
            topRight: Radius.circular(defaultSize)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Preparation Mode",
            style: TextStyle(
                fontSize: defaultSize * 2, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: defaultSize * 3),
          Text(
            recipe.description,
            style: TextStyle(color: Colors.black54, height: 1.3),
          ),
          SizedBox(height: defaultSize * 2),
          // ExpansionTile(
          //   title: Text(
          //     "MORE INFO",
          //     style: TextStyle(color: Colors.blue),
          //   ),
          //   children: [
          //     Text(
          //       recipe.description,
          //       style: TextStyle(color: Colors.black54, height: 1.3),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
    required this.recipe,
  });
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle nationText = TextStyle(color: Colors.black45);
    TextStyle titleText = TextStyle(
        color: Colors.black,
        fontSize: defaultSize * 3,
        letterSpacing: -0.7,
        fontWeight: FontWeight.bold);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 50,
      width: defaultSize * 30,
      // color: Colors.black45,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: defaultSize * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              recipe.nation.toUpperCase(),
              style: nationText,
            ),
            SizedBox(height: defaultSize),
            Text(
              recipe.title,
              style: titleText,
            ),
            SizedBox(height: defaultSize * 2),
            Text("Chef", style: nationText),
            Text(
              recipe.chef,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: defaultSize * 2),
            Text("Ingredients", style: nationText),
            SizedBox(height: defaultSize),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recipe.ingredients.length,
              itemBuilder: (context, index) {
                Ingredient ingredient = recipe.ingredients[index];
                return Text(
                  "${ingredient.name}: ${ingredient.quantity}",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                );
              },
            ),
            SizedBox(height: defaultSize * 2),
            Text("Time to cook: ${recipe.time.toString()} min",
                style: nationText),
          ],
        ),
      ),
    );
  }
}
