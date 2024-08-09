import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/filterScreen.dart';
import 'package:mealapp/screens/meals_screen.dart';
import 'package:mealapp/widgets/maindrawer.dart';

class Tabsscreen extends StatefulWidget {
  const Tabsscreen({super.key});

  @override
   _TabsscreenState createState() => _TabsscreenState();
}

class _TabsscreenState extends State<Tabsscreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoritemeal=[];
  Map<Filter,bool> selectredfilter={
    Filter.glutenfree:false,
    Filter.lactosefree:false,
    Filter.vegan:false,
    Filter.vegeterian:false,
  };



  void  _toglemealfavaritestatus(Meal meal){
    final isexist=_favoritemeal.contains(meal);
    if(isexist)_favoritemeal.remove(meal);
    else {
      setState(() {
        _favoritemeal.add(meal);
      });
    }
    

  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setScreen(String identifier){
if(identifier=='filters'){
   Navigator.of(context).pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (ctx)=> Filterscreen(cuurentfilter: selectredfilter,

  ))).then((v)=>setState(() {
    selectredfilter=v;
  }),);

}else{
  Navigator.of(context).pop(context);
}
  }

  @override
  Widget build(BuildContext context) {
final availableMeals = dummyMeals.where((meal) {
  if (selectredfilter[Filter.glutenfree]! && !meal.isGlutenFree) {
    return false;
  }

  if (selectredfilter[Filter.lactosefree]! && !meal.isLactoseFree) {
    return false;
  }

  if (selectredfilter[Filter.vegan]! && !meal.isVegan) {
    return false;
  }

  if (selectredfilter[Filter.vegeterian]! && !meal.isVegetarian) {
    return false;
  }

  return true;
}).toList();

    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Categories"),
      ),
      drawer: Maindrawer(onselectScreen: (String meal) { setScreen(meal); },),
      
      body: _selectedPageIndex == 0
          ?  CategoriesScreen(availablemeals:availableMeals,)
          :  MealsScreen(title: 'Favorite', meal: const [],ontoggleFavorite: _toglemealfavaritestatus,), // Example of a second screen
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
