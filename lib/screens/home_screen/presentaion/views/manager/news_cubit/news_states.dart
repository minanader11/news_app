import 'package:news_app/screens/home_screen/data/models/newsResponse.dart';

abstract class NewsStates{}
class NewsLoadingState extends NewsStates{}
class NewsFailureState extends NewsStates{
  String errorMessage;
  NewsFailureState({required this.errorMessage});
}
class NewsSuccessState extends NewsStates{
  List<News> news;
  NewsSuccessState({required this.news});
}