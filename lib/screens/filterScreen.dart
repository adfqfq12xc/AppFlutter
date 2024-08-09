import 'package:flutter/material.dart';

class Filterscreen extends StatefulWidget {
      final Map<Filter,bool> cuurentfilter;

   Filterscreen({super.key,required this.cuurentfilter});



  @override
  State<Filterscreen> createState() => _FilterscreenState();

}


 enum Filter{
  glutenfree,
  lactosefree,
  vegan,
  vegeterian,
}

class _FilterscreenState extends State<Filterscreen> {
  
@override
  void initState(){
  super.initState();
  gluteenFree=widget.cuurentfilter[Filter.glutenfree]!;
lactosefree=widget.cuurentfilter[Filter.lactosefree]!;
veagnfilter=widget.cuurentfilter[Filter.vegan]!;
vegetarianfilter=widget.cuurentfilter[Filter.vegeterian]!;

}
   bool gluteenFree=false;
   bool lactosefree=false;
   bool veagnfilter=false;
   bool vegetarianfilter=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filters"),),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenfree: gluteenFree,
            Filter.lactosefree: lactosefree,
            Filter.vegan: veagnfilter,
            Filter.vegeterian: vegetarianfilter,
          });
          return false;

        },
        child: Column(
          
          children: [custommethod('Gluten-Free',"Only include gluten-free meals",gluteenFree,(bool val){
            setState(() {
              gluteenFree=val;
            });
          }),
          custommethod('Lactose-free',"Only include lactose-free meals",lactosefree,(bool val){
            setState(() {
              lactosefree=val;
            });
          }),
          custommethod('Vegan',"Only include vegan meals",veagnfilter,(bool val){
            setState(() {
              veagnfilter=val;
            });
          }),
          
          custommethod('vegeterian',"Only include vegeterian meals",vegetarianfilter,(bool val){
            setState(() {
              vegetarianfilter=val;
            });
          })
          ],
        
          ),
      ),
    );
  }

  SwitchListTile custommethod(String title,String subtitle,bool filter,Function(bool newvl) onchanged) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: filter,
         onChanged: onchanged, 
        );
  }
}