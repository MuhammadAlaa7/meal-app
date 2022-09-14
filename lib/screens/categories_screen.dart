import 'package:flutter/material.dart';
import '../dummy_data.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  static const String routeName = 'categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((catItem) =>
                CategoryItem(catItem.id, catItem.title, catItem.color))
            .toList(),
      ),
    );
  }
}
