import 'package:flutter/material.dart';
import 'package:flutter_peliculasapp/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apikey = '3c674ead23447880bce6284cbf6588ce';
  String _baseUrl = "api.themoviedb.org";
  String _language = "es-ES";

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPages =0;

  MoviesProvider() {
    print("MoviesProvider Inicializando");
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page=1]) async {
   var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apikey, 'language': _language, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    print("Metodo getOnDisplayMovies");
    final jsonData= await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    //if(response.statusCode!=200) return print("error");
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPages++;
    print("Metodo getPopularMovies");
    final jsonData= await this._getJsonData('3/movie/popular',_popularPages);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    //print(popularResponse.results[0].title);
    notifyListeners();
  }
}
