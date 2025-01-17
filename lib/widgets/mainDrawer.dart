import 'package:flutter/material.dart';

import '../screens/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function action)
  {
    return  ListTile(
      leading: Icon(
        icon,
        size: 26
      ),
      title: Text(title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: action,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'DelyMeal',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              )
            ),
          ),
          SizedBox(
            height: 20,
          ),
         buildListTile('Meals', Icons.restaurant, () {
           Navigator.of(context).pushReplacementNamed('/');
         }),
         buildListTile('Filters', Icons.settings, () {
           Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
         }),
        ],
      ),
    );
  }
}