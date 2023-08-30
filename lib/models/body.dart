import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/category_bundle.dart';
import 'package:flutter_application_1/size_config.dart';

double defaultSize = SizeConfig.defaultSize;

class Body extends StatelessWidget {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
      },
      child: Column(
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
            child: TextField(
                focusNode: _searchFocusNode,
                decoration: InputDecoration(
                  hintText: 'Search recipes...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultSize * 1.5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultSize * 1.5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                cursorColor: Colors.grey),
          ),
          Categories(),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: GridView.builder(
                itemCount: categoryBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 0,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) => CategoryBundleCard(
                  categoryBundle: categoryBundles[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Chefs",
    "Chinese",
    "French",
    "Italian",
    "Mexican",
    "Lebanese"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultSize * 2),
      child: SizedBox(
        height: defaultSize * 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoriesItem(index),
        ),
      ),
    );
  }

  Widget buildCategoriesItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: defaultSize * 2),
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize * 2,
          vertical: defaultSize * 0.6,
        ),
        decoration: BoxDecoration(
          color:
              selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
          borderRadius: BorderRadius.circular(defaultSize * 1.5),
        ),
        child: Text(
          categories[index],
          style: TextStyle(fontWeight: FontWeight.bold, color: button),
        ),
      ),
    );
  }
}
