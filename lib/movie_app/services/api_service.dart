import 'dart:convert';

import 'package:homework/movie_app/models/movie_detail.dart';
import 'package:homework/movie_app/models/movie.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static String popular = "popular";
  static String nowPlaying = "now-playing";
  static String comingSoon = "coming-soon";
  static String movie = 'movie';

  static Future<List<MovieModel>> getPopularMoves() async {
    List<MovieModel> moviceInstances = [];

    final url = Uri.parse('$baseUrl/$popular');
    final respose = await http.get(url);

    if (respose.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(respose.body);

      final List<dynamic> movies =
          decodedJson['results']; // 'results' 키 안의 값만 가져오기

      for (var movie in movies) {
        moviceInstances.add(MovieModel.fromJson(movie));
      }

      return moviceInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowMoves() async {
    List<MovieModel> moviceInstances = [];

    final url = Uri.parse('$baseUrl/$nowPlaying');
    final respose = await http.get(url);

    if (respose.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(respose.body);

      final List<dynamic> movies =
          decodedJson['results']; // 'results' 키 안의 값만 가져오기

      for (var movie in movies) {
        moviceInstances.add(MovieModel.fromJson(movie));
      }

      return moviceInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getCommingMoves() async {
    List<MovieModel> moviceInstances = [];

    final url = Uri.parse('$baseUrl/$comingSoon');
    final respose = await http.get(url);

    if (respose.statusCode == 200) {
      final Map<String, dynamic> decodedJson = jsonDecode(respose.body);

      final List<dynamic> movies =
          decodedJson['results']; // 'results' 키 안의 값만 가져오기

      for (var movie in movies) {
        moviceInstances.add(MovieModel.fromJson(movie));
      }

      return moviceInstances;
    }
    throw Error();
  }

  // 영화 세부 정보 리턴
  static Future<MovieDetailModel?> getMovieDetailModel(String movieId) async {
    MovieDetailModel? retVal;
    var url = Uri.parse('$baseUrl/$movie?id=$movieId');
    print(url);
    try {
      var httpResp = await http.get(url);
      if (httpResp.statusCode == 200) {
        var jsonDec = jsonDecode(httpResp.body);

        retVal = MovieDetailModel.fromJson(jsonDec);
      }

      return retVal;
    } catch (e) {
      print(e.toString());
    }

    throw Error();
  }
}
