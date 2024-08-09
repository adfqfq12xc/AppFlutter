import 'package:flutter/material.dart';

class Maindrawer extends StatelessWidget {
  const Maindrawer({super.key, required this.onselectScreen});
  final void Function(String meal) onselectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(children: [
        DrawerHeader(
          decoration: BoxDecoration(gradient: 
            LinearGradient(colors:  [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
            ]

            ),

          ),
           padding: const EdgeInsets.all(20),child: Row(children: [
            Icon(Icons.fastfood,
            size: 48,
            color: Theme.of(context).colorScheme.primary,),
            const SizedBox(width: 20,),
            const Text('Cooking up',style:TextStyle(fontSize: 24,color: Colors.white),)


        ],)
        ),
        ListTile(
          onTap: (){
            onselectScreen("meals");
          },
          leading: Icon(Icons.restaurant,
          color: Theme.of(context).colorScheme.onSurface,),
          title:    const Text('Meals',style:TextStyle(fontSize: 24,color: Colors.white),),
        ),
           ListTile(
          onTap: (){ 
            onselectScreen("filters");
          
          },
          leading: Icon(Icons.settings,
          color: Theme.of(context).colorScheme.onSurface,),
          title:    const Text('Filters',style:TextStyle(fontSize: 24,color: Colors.white),),
        ),
        


       ],) ,
      );
}
}