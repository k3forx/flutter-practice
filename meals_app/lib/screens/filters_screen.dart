import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    void Function(bool)? updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals', _glutenFree, (_) {
                  setState(() {
                    _glutenFree = !_glutenFree;
                  });
                }),
                _buildSwitchListTile('Lactose-free',
                    'Only include lactose-free meals', _lactoseFree, (_) {
                  setState(() {
                    _lactoseFree = !_lactoseFree;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                    (_) {
                  setState(() {
                    _vegetarian = !_vegetarian;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals', _vegan, (_) {
                  setState(() {
                    _vegan = !_vegan;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
