import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/chef_recipes.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/intro_screen.dart';
import 'package:flutter_application_1/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/chefRecipes': (context) => ChefRecipes(
            chefName:
                ModalRoute.of(context)!.settings.arguments as String? ?? ''),
      },
    );
  }
}
