import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/recipe_details.dart';
import '../models/recipes.dart';
import '../size_config.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  const DetailsScreen({
    required Key key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 249),
      appBar: buildAppBar(context, defaultSize),
      body: RecipeDetails(recipe: recipe, key: UniqueKey()),
    );
  }

  AppBar buildAppBar(BuildContext context, double defaultSize) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("icons/arrow-long-left.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("icons/heart-svgrepo-com.svg"),
          onPressed: () {},
        ),
        SizedBox(width: defaultSize),
      ],
    );
  }
}
