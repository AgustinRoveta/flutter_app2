import 'dart:convert';
import 'package:app_peliculas/models/now_playing_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
String _apiKey='e2231daa807905aa0f05f580faa1e9cc';

String _baseUrl='api.themoviedb.org';

String _language='es-ES';


  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url =Uri.https(_baseUrl, '3/movie/now_playing', {
     'api_key' : _apiKey,
     'language':_language,
     'page'    :'1',
      });

    final response = await http.get(url);
    final nowPlayingResponse=NowPlayingResponse.fromMap(jsonDecode(response.body));
    // if (response.statusCode!=200) return print('error');
    print(nowPlayingResponse.results[12].title);
  }
}
