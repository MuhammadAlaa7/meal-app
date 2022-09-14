import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';


import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
 final List<Meal> favoriteMeals ;
 TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List screens = [];


  @override
  void initState() {
    screens = [

    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorites'},

    ];
    super.initState();
  }

/*
List<Widget> pages = [
  CategoriesScreen(),
  FavoriteScreen(),

];                                        I made them in one list instead
List<String> titles = [
  'Categories',
  'Favorites',
];
*/

   int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(screens[_currentIndex]['title']),
        ),
        body: screens[_currentIndex]['page'],
        drawer: const MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          selectedFontSize: 20,
          unselectedFontSize: 17,
          iconSize: 30,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
          ],
        ),
    );
  }
}
