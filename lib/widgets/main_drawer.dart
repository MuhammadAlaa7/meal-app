import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/meal_details.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(IconData icon, String text, Function() onTap) {
    return ListTile(
      leading: Icon(icon, size: 30,),
      title: Text(text,  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800,letterSpacing: 5),),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 400,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 150,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: const Text(
              'Meal app',
              style: TextStyle(
                letterSpacing: 7,
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: Colors.pink,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          buildListTile(Icons.restaurant, 'Meal', () => Navigator.pushReplacementNamed(context , '/'), ),
          const SizedBox(height: 20,),
          buildListTile(Icons.settings, 'Filters', () => Navigator.pushNamed(context, FiltersScreen.routeName)),
        ],
      ),
    );
  }
}
