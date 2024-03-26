import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';

abstract class SourcesStates {}
class SourcesLoadingState extends SourcesStates{}
class SourcesFailureState extends SourcesStates{
  String errorMessage;
  SourcesFailureState({required this.errorMessage});
}
class SourcesSuccessState extends SourcesStates{
  List<Source> sources;
  SourcesSuccessState({required this.sources});
}
