import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/mealdetailscreen.dart';
import 'package:mealapp/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meal, required this.ontoggleFavorite});
  final String title;
  final List<Meal> meal;
  final Function(Meal meal) ontoggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),
      
      ),
      body:SingleChildScrollView(
        child: Column(children: [
          ...meal.map((e)=>MealItem(meal: e,onselectmeal: (Meal meal){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Mealdetailscreen(meal: meal, ontoggleFavorite:ontoggleFavorite ,)));
          },)).toList(),
        ],),
      ),

    );
  }
}