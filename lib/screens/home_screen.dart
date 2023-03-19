import 'package:flutter/material.dart';
import 'package:flutter_peliculasapp/providers/movies_provider.dart';
import 'package:flutter_peliculasapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider= Provider.of<MoviesProvider>(context);

   //print(moviesProvider.onDisplayMovies);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Peliculas en cines"),
          //elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
                CardSwiper(movies: moviesProvider.onDisplayMovies), 
                MovieSlider(
                  movies: moviesProvider.popularMovies, 
                  title: "!POPULARES!", 
                  onNextPage: (){
                      moviesProvider.getPopularMovies();
                  }
                ),
                
              ],
          ),
        ));
  }
}
