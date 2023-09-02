import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/body.dart';
import 'package:flutter_application_1/models/dishes.dart';

import '../size_config.dart';

class DishDetails extends StatelessWidget {
  final Dish dish;
  const DishDetails({
    required this.dish,
  });

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  DetailsContainer(
                    dish: dish,
                  ),
                  PreparationMode(),
                ],
              ),
              Positioned(
                top: defaultSize * 17,
                right: -defaultSize * 9,
                child: Hero(
                  tag: dish.id,
                  child: Image.network(
                    dish.image,
                    height: defaultSize * 50,
                    width: defaultSize * 38,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container PreparationMode() {
    return Container(
      // constraints: BoxConstraints(minHeight: defaultSize * 45),
      padding: EdgeInsets.only(
          top: defaultSize * 2, left: defaultSize * 2, right: defaultSize * 2),
      decoration: BoxDecoration(
        // color: Colors.red,
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
            dish.description,
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
    required this.dish,
  });
  final Dish dish;

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
      height: defaultSize * 49.5,
      width: defaultSize * 50,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: defaultSize * 2),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: defaultSize),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      dish.nation.toUpperCase(),
                      style: nationText,
                    ),
                    SizedBox(height: defaultSize),
                    Text(
                      dish.title,
                      style: titleText,
                    ),
                    SizedBox(height: defaultSize * 2),
                    Text("Chef", style: nationText),
                    Text(
                      dish.chef,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: defaultSize * 2),
                    Text("Ingredients", style: nationText),
                    SizedBox(height: defaultSize),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dish.ingredients.length,
                      itemBuilder: (context, index) {
                        Ingredient ingredient = dish.ingredients[index];
                        return Text(
                          "${ingredient.name}: ${ingredient.quantity}",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        );
                      },
                    ),
                    SizedBox(height: defaultSize * 2),
                    Text("Time to cook: ${dish.time.toString()} min",
                        style: nationText),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
