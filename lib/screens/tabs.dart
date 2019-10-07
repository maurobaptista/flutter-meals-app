import 'package:flutter/material.dart';

import '../widgets/mainDrawer.dart';

import './categories.dart';
import './favorites.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _tabs = [
    {
      'tab': CategoriesScreen(),
      'title': 'Categories'
    },
    {
      'tab': FavoritesScreen(),
      'title': 'Your Favorite'
    },
  ];
  int _currentTab = 0;

  void _selectTab(int index)
  {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_currentTab]['title']),
      ),
      drawer: MainDrawer(),
      body: _tabs[_currentTab]['tab'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}