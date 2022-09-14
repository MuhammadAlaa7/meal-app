import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

class MealDetails extends StatefulWidget {
  static String routeName = 'Meal Details';
  final Function toggleFavorites;
  final Function isFavorite;

  MealDetails(this.toggleFavorites, this.isFavorite);

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    // give me the first meal satisfy this condition

    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedMeal.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.all(15),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
              buildSectionText(context, 'Ingredients'),
              buildContent(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              )),
              buildSectionText(context, 'Steps'),
              buildContent(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: Colors.purple,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              widget.toggleFavorites(mealId);

              setState(() {
                widget.isFavorite(mealId);
              });
            },
            child:  Icon(
              widget.isFavorite(mealId) ? Icons.star : Icons.star_border,
            ),

        ),);
  }

  Container buildContent(Widget child) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      width: 500,
      height: 300,
      child: child,
    );
  }

  Container buildSectionText(BuildContext context, text) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
