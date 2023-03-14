import 'package:flutter/material.dart';
import 'package:flutter_peliculasapp/screens/details_screen.dart';
import 'package:flutter_peliculasapp/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen()      
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            color: Colors.indigo
          )
      ),

    );
  }
}