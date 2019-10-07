import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/mealItem.dart';

import '../dummy.dart';

class CategoryMealsScreen extends StatefulWidget
{
  static const routeName = '/category/screens';

  List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category category;
  List<Meal> categoryMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Category>;
      category = routeArgs['category'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();

      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    }
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
        ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index], _removeMeal);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
