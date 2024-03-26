import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/api_constants.dart';
import 'package:news_app/screens/home_screen/data/models/newsResponse.dart';
import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';
class ApiService {
  static Future<SourcesResponse> getSources(String categoryId)async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourcesApi,{
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });
    try {
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      var sources = SourcesResponse.fromJson(data);
      return sources;
    } catch(e){
      throw e;
    }
  }
  static Future<NewsResponse> getNews(String sourceId, String categoryId)async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'q': categoryId,

    });
    try {
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      var news = NewsResponse.fromJson(data);
      return news;
    } catch(e){
      throw e;
    }
  }
  static Future<NewsResponse> getSearchedNews(String search)async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
      'apiKey': ApiConstants.apiKey,
      'q': search,
    });
    try {
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      var news = NewsResponse.fromJson(data);
      return news;
    } catch(e){
      throw e;
    }
  }
}