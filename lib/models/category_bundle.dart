import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

double defaultSize = SizeConfig.defaultSize;

class CategoryBundleCard extends StatelessWidget {
  final CategoryBundle categoryBundle;
  const CategoryBundleCard({super.key, required this.categoryBundle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String chefName = categoryBundle.chef;
        Navigator.pushNamed(
          context,
          '/chefRecipes',
          arguments: chefName,
        );
      },
      child: AspectRatio(
        aspectRatio: 1.8,
        child: Container(
          decoration: BoxDecoration(
            color: categoryBundle.color,
            borderRadius: BorderRadius.circular(defaultSize * 1.8),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(defaultSize * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        categoryBundle.title,
                        style: TextStyle(
                          fontSize: defaultSize * 2,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: defaultSize * 0.5),
                      Text(
                        categoryBundle.description,
                        style: TextStyle(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      buildInfoRow(defaultSize,
                          iconSrc: "icons/pot.svg",
                          text: "${categoryBundle.ingredients} Recipes"),
                      SizedBox(height: defaultSize * 0.5),
                      buildInfoRow(defaultSize,
                          iconSrc: "icons/chef.svg",
                          text: "Chef ${categoryBundle.chef}"),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              SizedBox(width: defaultSize * 0.5),
              AspectRatio(
                aspectRatio: 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  child: Image.asset(
                    categoryBundle.imageSrc,
                    fit: BoxFit.fill,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize,
      {required String iconSrc, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
