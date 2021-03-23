import 'package:flutter/material.dart';
import 'package:gif_explorer/ui/screens/home/home_page.dart';

void main() {
  runApp(EntryPoint());
}

class EntryPoint extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gifs Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.black12,
        iconTheme: IconThemeData(
          color: Colors.pink,
          size: 32.0
        ),
        
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black12,
          actionsIconTheme: IconThemeData(
            color: Colors.pink,
            size: 32.0,
          )
        )
      ),
      home: HomePage(),
    );
  }
} 
