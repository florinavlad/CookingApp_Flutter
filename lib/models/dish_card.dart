import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/chef_recipes.dart';
import '../size_config.dart';
import 'dishes.dart';

class DishCard extends StatelessWidget {
  final Dish dish;
  const DishCard({
    required Key key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize),
      child: SizedBox(
        width: defaultSize * 20,
        child: AspectRatio(
          aspectRatio: 0.8,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Container(
                // color: Colors.red,
                ),
            ClipPath(
              clipper: CategoryCustomShape(),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: EdgeInsets.only(
                    top: defaultSize * 3,
                    left: defaultSize * 1,
                    right: defaultSize * 1,
                    bottom: defaultSize * 2,
                  ),
                  color: cardsColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        dish.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: defaultSize),
                      Text("${dish.subTitle}")
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AspectRatio(
                aspectRatio: 1.1,
                child: Hero(
                  tag: dish.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "icons/spinner.gif",
                    image: dish.image,
                    fit: BoxFit.scaleDown,
                    width: 10,
                    height: 40,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
