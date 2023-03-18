import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatelessWidget {

  final List<Movie> movies;
  final String? title;

  const MovieSlider({super.key, required this.movies, this.title});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //color: Colors.red,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(title ?? "Popular",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(height: 5,),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, int index){
                     final movie= movies[index];
                      return _MoviePoster(movie: movie);
                  } 
                  )
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      //color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, 'details', 
                                                    arguments: 'movie-instance'),
            
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage("lib/assets/no-image.jpg"), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
