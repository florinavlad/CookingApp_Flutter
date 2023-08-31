import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/dishes.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/dish_card.dart';
import '../services/fetchDishes.dart';
import '../size_config.dart';
import 'details_screen.dart';

class ChefRecipes extends StatelessWidget {
  final String chefName;
  final TextStyle normalTextStyle = GoogleFonts.euphoriaScript(
    fontSize: 23,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );

  ChefRecipes({required this.chefName});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(dish: dish, key: UniqueKey()),
          ),
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(defaultSize),
                  child: Text(
                    "Recipes by $chefName",
                    style: normalTextStyle,
                  ),
                ),
              ),
              FutureBuilder<List<Dish>>(
                future: fetchDishes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        double availableWidth = constraints.maxWidth;
                        int numberOfItemsPerRow = availableWidth > 600 ? 4 : 2;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: numberOfItemsPerRow,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Dish dish = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                        dish: dish, key: UniqueKey()),
                                  ),
                                );
                              },
                              child: DishCard(
                                dish: dish,
                                key: UniqueKey(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
