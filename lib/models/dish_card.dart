import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/title.dart';

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
                  padding: EdgeInsets.all(defaultSize * 3),
                  color: cardsColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TitleText(key: UniqueKey(), title: dish.title),
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
                    fit: BoxFit.contain,
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
