import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

   const CategoryItem(this.id, this.title, this.color);
  
void navigate(BuildContext ctx ) {
  Navigator.pushNamed(ctx, CategoryMealsScreen.routeName ,
  arguments:
  {

    'id': id,
   'title' : title,

  },
  );
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: ()
      {
        navigate(context);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        )),
      ),
    );
  }
}
