import 'package:flutter/material.dart';
import './dummy.dart';

import './screens/tabs.dart';
import './screens/categories.dart';
import './screens/categoryMeals.dart';
import './screens/mealDetail.dart';
import './screens/favorites.dart';
import './screens/filters.dart';

import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filters) {
    setState() {
      _filters = filters;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        return true;
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (_) {
        return MaterialPageRoute(
          builder: ((context) => CategoriesScreen()),
        );
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(
          builder: ((context) => CategoriesScreen()),
        );
      },
    );
  }
}
