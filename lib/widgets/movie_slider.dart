import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider({
        super.key, 
        required this.movies,
        required this.onNextPage,
        this.title});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollcontroller = new ScrollController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollcontroller.addListener(() {
      if(scrollcontroller.position.pixels>=scrollcontroller.position.maxScrollExtent -500){
          widget.onNextPage();
      }
     });
  }



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
              child: Text(widget.title ?? "Popular",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(height: 5,),
          Expanded(
              child: ListView.builder(
                controller: scrollcontroller,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (_, int index){
                     final movie= widget.movies[index];
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
