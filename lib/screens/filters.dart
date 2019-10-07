import 'package:flutter/material.dart';

import '../widgets/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  final Map<String, bool> filters;
  final Function saveFilters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitch(String title, String subtitle, bool currentValue, Function action) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: action
    );
  }

  @override
  initState()
  {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };

              widget.saveFilters(selectedFilters);
            }
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitch(
                    'Gluten-Free',
                    'Only Include gluten-free meals',
                    _glutenFree,
                    (newValue) {
                      setState() {
                        _glutenFree = newValue;
                      }
                    }  
                  ),
                  _buildSwitch(
                    'Lactose-Free',
                    'Only Include lactose-free meals',
                    _lactoseFree,
                    (newValue) {
                      setState() {
                        _lactoseFree = newValue;
                      }
                    }  
                  ),
                  _buildSwitch(
                    'Vegetarian',
                    'Only Include vegetarian meals',
                    _vegetarian,
                    (newValue) {
                      setState() {
                        _vegetarian = newValue;
                      }
                    }  
                  ),
                  _buildSwitch(
                    'Vegan',
                    'Only Include vegan meals',
                    _vegan,
                    (newValue) {
                      setState() {
                        _vegan = newValue;
                      }
                    }  
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}