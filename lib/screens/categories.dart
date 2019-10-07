import 'package:flutter/material.dart';

import '../dummy.dart';

import '../widgets/categoryItem.dart';

class CategoriesScreen extends StatelessWidget
{
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: GridView(
        children: DUMMY_CATEGORIES.map((category) => CategoryItem(category: category)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}