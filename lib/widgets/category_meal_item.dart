import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;


  const MealItem({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,

  });


  String get complexityText {
    String str = '';
    if (complexity == Complexity.Simple) {
      str =  'Simple';
    }
    if (complexity == Complexity.Hard) {
      str =  'Hard';
    }
    if (complexity == Complexity.Challenging) {
      str =  'Challenging';
    }
    return str ;
  }


  String get affordabilityText{

    switch(affordability)
    {
      case Affordability.Affordable :
        return 'Affordable';

      case Affordability.Pricey:
        return  'Pricey';

      case Affordability.Luxurious:
        return 'Luxurious';
      default :
        return 'Unknown';


    }
    //return str ;
  }

  /*String get affordabilityText{
    String str = '';
    if (affordability == Affordability.Affordable) {
      str =  'Affordable';
    }
    if (affordability == Affordability.Pricey) {
      str =  'Pricey';
    }
    if (affordability == Affordability.Luxurious) {
      str =  'Luxurious';
    }
    return str ;
}*/

  void selectMeal(BuildContext ctx ) {
    Navigator.of(ctx).pushNamed( MealDetails.routeName , arguments: id   // id >>> to show only the meal with this id

    ).then((returnedId) {    // this is the value returned from the pop
      if( returnedId != null )
        {
          // removeMeal(returnedId);
        }
    } );
    // the id is received when the the mealDetails screen
    // destroyed with pop and sending arguments with pop
  }

      @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  // to make the image as a border at the ages >>>
                  // gives the image border radius or any other widget
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 50,

                  child: Container(

                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    color: Colors.black54,

                   child: Text(

                    title,
                    style: const TextStyle(

                      fontSize: 28,
                      color: Colors.white,
                    ),
                     textAlign: TextAlign.center,
                     overflow: TextOverflow.fade,
                     softWrap: true,
                  )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround ,
               children: [
                 Row(
                   children: [
                      const Icon(Icons.schedule,size: 30,),
                      const  SizedBox(width: 6,),
                     Text( '$duration min' ,style: const TextStyle(fontSize: 20),),
                     ]
                   ,),

                 Row(
                     children: [
                       const Icon(Icons.work,size: 30,),
                       const SizedBox(width: 6,),
                       Text( complexityText ,style: const TextStyle(fontSize: 20),),
                     ]
                 ),

                 Row(
                     children: [
                       const Icon(Icons.attach_money, size: 30,),
                       const SizedBox(width: 6,),
                       Text(affordabilityText, style: const TextStyle(fontSize: 20),),
                     ]
                 ),

               ],
               ),
            ),
          ],
        ),
      ),
    );
  }
}
