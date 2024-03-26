import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';

class SourceProvider extends ChangeNotifier{
  Source source=Source();
  void changeSource(Source newSource){
    source=newSource;
    //notifyListeners();
  }
}