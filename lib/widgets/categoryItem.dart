import 'package:flutter/material.dart';

import '../screens/categoryMeals.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    @required this.category,
  });

  void selectCategory(BuildContext context)
  {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'category': category,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(category.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        )
      ),
    );
  }
}