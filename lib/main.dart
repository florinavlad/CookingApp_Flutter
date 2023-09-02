import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/chef_recipes.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/intro_screen.dart';
import 'package:flutter_application_1/services/fetchDishes.dart';
import 'package:flutter_application_1/size_config.dart';

import 'models/category.dart';
import 'models/dishes.dart';

Future<void> main() async {
  List<Dish> yourRecipesList = await fetchDishes();
  updateReciepesCount(yourRecipesList);
  // for (Dish dish in yourRecipesList) {
  // print("Dish Name: ${dish.title}");
  // print("Chef Name: ${dish.chef}");
  // }
  runApp(MyApp(yourRecipesList: yourRecipesList));
}

class MyApp extends StatelessWidget {
  final List<Dish> yourRecipesList;

  const MyApp({required this.yourRecipesList, Key? key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cooking App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/home': (context) => HomeScreen(),
        '/chefRecipes': (context) {
          final chefName =
              ModalRoute.of(context)!.settings.arguments as String? ?? '';
          final List<Dish> recipes =
              filterRecipesByChef(chefName, yourRecipesList);
          return ChefRecipes(chefName: chefName, recipes: recipes);
        }
      },
    );
  }
}
