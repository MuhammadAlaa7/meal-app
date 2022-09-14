import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

import '../models/meal.dart';
import '../widgets/category_meal_item.dart';
import '../widgets/main_drawer.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  static String routeName =
      'Cat Meal Screen'; // used in the routes for push named

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

late  String categoryTitle;
 late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
// this method operate first when the app starts without context problems

    super.didChangeDependencies();

    final routeArg = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];

     categoryTitle = routeArg['title']!;

    // the categoryMeals list is dummy_meals list but after filtration
     categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
      // return the meal [ list of Meals after filtration ] which its categories property contains categoryId
    }).toList();

  }






void removeMeal(String mealId)
{
 setState(() {
   categoryMeals.removeWhere((meal) => meal.id == mealId );
 });
}

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle , style:  Theme.of(context).textTheme.titleLarge,),
      ),

      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            categories: categoryMeals[index].categories,
            ingredients: categoryMeals[index].ingredients,
            isGlutenFree: categoryMeals[index].isGlutenFree,
            isLactoseFree: categoryMeals[index].isLactoseFree,
            isVegan: categoryMeals[index].isVegan,
            isVegetarian: categoryMeals[index].isVegetarian,
            steps: categoryMeals[index].steps,



          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
