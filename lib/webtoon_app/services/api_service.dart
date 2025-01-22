import 'dart:convert';

import 'package:homework/webtoon_app/models/webtoon.dart';
import 'package:homework/webtoon_app/models/webtoon_detail.dart';
import 'package:homework/webtoon_app/models/webtoon_episode_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    final respose = await http.get(url);

    if (respose.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(respose.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final respose = await http.get(url);

    if (respose.statusCode == 200) {
      final webtoon = jsonDecode(respose.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getToongetLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$id');
    final respose = await http.get(url);

    if (respose.statusCode == 200) {
      final webtoons = jsonDecode(respose.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonEpisodeModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
