import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/category_meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals ;
  FavoriteScreen(this.favoriteMeals);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoriteMeals.isEmpty ? Center(
        child: Text(
          'You have no favorites yet - add some ',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      )
      :
      ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            categories: favoriteMeals[index].categories,
            ingredients: favoriteMeals[index].ingredients,
            isGlutenFree: favoriteMeals[index].isGlutenFree,
            isLactoseFree: favoriteMeals[index].isLactoseFree,
            isVegan: favoriteMeals[index].isVegan,
            isVegetarian: favoriteMeals[index].isVegetarian,
            steps: favoriteMeals[index].steps,



          );
        },
        itemCount: favoriteMeals.length,
      ),
    );
  }
}
