import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:tvmaze_api_integration/model/episode.dart';
import 'package:tvmaze_api_integration/model/show_info.dart';

class TVMazeApi {
  static final baseUrl = 'http://api.tvmaze.com/';

  Future<EpisodesList> getShowByName(String showName) async {
    final path = 'search/shows?q=$showName';
    final url = baseUrl + path;
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        final responseBody = response.body;
        var body = json.jsonDecode(responseBody);
        return EpisodesList.fromJson(body);
      } else {
        throw Exception('Invalid response');
      }
    } on Exception catch(error) {
      throw Exception(error);
    }
  }

  Future<ShowInfo> getShowInfoById(int showId) async {
    final path = 'shows/$showId';
    final url = baseUrl + path;
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        final responseBody = response.body;
        var body = json.jsonDecode(responseBody);
        return ShowInfo.fromJson(body);
      } else {
        throw Exception('Invalid response');
      }
    } on Exception catch(error) {
      throw Exception(error);
    }
  }
}
