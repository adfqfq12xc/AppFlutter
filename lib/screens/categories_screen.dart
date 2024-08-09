import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availablemeals});
  final List<Meal> availablemeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data'),
      ),
      body: GridView(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 20
      ) ,
      children: 
      [
       ...availableCategories.map((e)=>CategoryGridItem(category: e,availableMeals: availablemeals,)
       )
      ],
      ),
    );
  }
}