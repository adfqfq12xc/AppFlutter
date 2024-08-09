import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealapp/screens/tabsscreen.dart';

void main() {
  runApp( const  ProviderScope(child:  MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 132, 0, 1)
        
        ),
        textTheme:GoogleFonts.latoTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ), 
      ),

      home:  Tabsscreen()); 
      

  }
}
