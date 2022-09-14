import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  // the list will take initial value as dummy meals without filtration

   Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,                          // storing the filters the user made
    'vegetarian' : false,
    'vegan' : false,
  };

  void setFilters(Map<String,bool> filtersData) {


     setState(() {

       _filters = filtersData;
       // after updating the values of filtration update this list
       availableMeals = DUMMY_MEALS.where((meal) {
         if( _filters['gluten'] == true && meal.isGlutenFree == false ) {
           return false;
         }
          if ( _filters['lactose'] ==true && !meal.isLactoseFree )
           {
             return false;
           }
         if( _filters['vegetarian'] == true && meal.isVegetarian == false ) {
           return false ;
         }
         if( _filters['vegan'] == true && meal.isVegan == false ) {
           return false ;  // don't put it in the list
         }
         return true ;
   //  return without a condition  / put it in the list without the need for a condition


       }).toList();

     });
   }

void toggleFavorites(String mealId ) {
  final int existingIndex =  favoriteMeals.indexWhere((meal) => meal.id == mealId);
  // if this meal is existing remove it
  if(existingIndex >= 0)
    {
      favoriteMeals.removeAt(existingIndex);
    }
  else
    {
      // if the meal is not existing in the favorite list >> existingIndex = -1 <<
      // so add it from the main list without filtration
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
}

bool isFavorite(String id){

  return  favoriteMeals.any((meal) => meal.id == id);
  // does any meal in this list satisfies this test ?
}



   @override
  Widget build(BuildContext context) {


    return MaterialApp(
      // this the new way for the theme
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromARGB(255,208  , 210, 214),
        textTheme: ThemeData.light().textTheme.copyWith(

          titleLarge: const TextStyle(
            fontSize: 30,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: const TextStyle(
            fontSize: 28,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodySmall:  const TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto',
            //fontWeight: FontWeight.w300,
            color: Colors.black,

          ),

        ),
      ),



      routes: {
        '/' : (context ) => TabsScreen(favoriteMeals),
        CategoryMealsScreen.routeName : (context) =>  CategoryMealsScreen(availableMeals),
        MealDetails.routeName :(context) => MealDetails(toggleFavorites,isFavorite),
        FiltersScreen.routeName : (context) =>  FiltersScreen(setFilters, _filters),
        CategoriesScreen.routeName : (context) => CategoriesScreen(),
      },
    );
  }
}
