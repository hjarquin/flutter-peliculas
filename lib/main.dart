import 'package:flutter/material.dart';
import 'package:flutter_peliculasapp/providers/movies_provider.dart';
import 'package:flutter_peliculasapp/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
            ChangeNotifierProvider(create:(_) => MoviesProvider(), lazy: false,),
        ],
        child: MyApp(),
      );
  }
}

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
        useMaterial3: true,
          appBarTheme: AppBarTheme(
            color: Colors.indigo
          )
      ),

    );
  }
}