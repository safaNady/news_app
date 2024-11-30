import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/api/model/articles_response/articles_response.dart';
import 'package:news_app/data/api/model/sourses_response/sources_response.dart';

class ApiManager {
  static const String _baseUrl = 'newsapi.org';
  static const String _apiKey = 'be69a84c535c43928fdad67c7cd21548';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';

  static Future<SourcesResponse> getSources(String categoryItd) async {
    Uri url = Uri.https(_baseUrl, sourcesEndPoint, {
      'apiKey': _apiKey,
      'category': categoryItd,
    });
    http.Response serverResponse =
        await http.get(url); // make a network Request
    Map<String, dynamic> json =
        jsonDecode(serverResponse.body); // convert from string to json
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(_baseUrl, articlesEndPoint, {
      'apiKey': _apiKey,
      'sources': sourceId,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);

    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }

  static Future<ArticlesResponse> search(String query) async {
    Uri url = Uri.https(_baseUrl, articlesEndPoint, {
      'apiKey': _apiKey,
      'q': query,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);

    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}

//https://newsapi.org/v2/top-headlines/sources?apiKey=0359fd171b0645bfba6268b28fc9896c
