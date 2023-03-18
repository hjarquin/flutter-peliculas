import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  String _apikey='3c674ead23447880bce6284cbf6588ce';
  String _baseUrl="api.themoviedb.org";
  String _language="es-ES";

  MoviesProvider() {
    print("MoviesProvider Inicializando");
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
    print("Metodo getOnDisplayMovies");
    var url =
        Uri.https(_baseUrl, '3/movie/now_playing', {
            'api_key': _apikey,
            'language': _language,
            'page': '1'
        });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    //if(response.statusCode!=200) return print("error");

    print(decodedData["results"]);
  }
}
