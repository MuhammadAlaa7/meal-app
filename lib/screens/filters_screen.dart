import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = 'Filter Screen';

   final Function saveFilters;
   final Map<String, bool > currentFilters;
   FiltersScreen(this.saveFilters , this.currentFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegan = false;
  bool vegetarian = false;                 // these are initial values for the switches
  bool lactoseFree = false;

  @override
  void initState() {
    super.initState();
    glutenFree = widget.currentFilters['gluten']!;
    lactoseFree = widget.currentFilters['lactose']!;
    vegetarian = widget.currentFilters['vegetarian']!;            /// overriding the values according to the switches changes
    vegan = widget.currentFilters['vegan']!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {

                      final Map<String, bool> filtersData = {
                        'gluten': glutenFree,
                        'lactose': lactoseFree,
                        'vegetarian': vegetarian,
                        'vegan': vegan,

                      };

                      widget.saveFilters(filtersData);
              },
              icon: const Icon(
                Icons.save,
              )),
        ],
      ),
     drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(26),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.titleMedium,
              )),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  glutenFree,
                  (value) {
                    setState(() {
                      glutenFree = value;
                    });
                  },
                  'Gluten-free',
                  'only include gluten-free meals',
                ),
                buildSwitchListTile(
                  lactoseFree,
                  (value) {
                    setState(() {
                      lactoseFree = value;
                    });
                  },
                  'Lactose-free',
                  'only include lactose-free meals',
                ),
                buildSwitchListTile(
                  vegetarian,
                  (value) {
                    setState(() {
                      vegetarian = value;
                    });
                  },
                  'Vegetarian',
                  'only include vegetarian meals',
                ),
                buildSwitchListTile(
                  vegan,
                  (value) {
                    setState(() {
                      vegan = value;
                    });
                  },
                  'Vegan',
                  'only include vegan meals',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildSwitchListTile(bool value, Function(bool val) onChanged, String text,
      String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        title: Text(text),
        subtitle: Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
