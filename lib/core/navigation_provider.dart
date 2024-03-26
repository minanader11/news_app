import 'package:flutter/widgets.dart';
import 'package:news_app/screens/home_screen/data/models/category_model.dart';
import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';
import 'package:news_app/screens/home_screen/presentaion/views/categories_view.dart';

class NavigationProvider extends ChangeNotifier{
  int navigationIndex=CategoriesView.categoriesview;
  int searchIndex=0;
  bool isSearching= false;
  String searchNews='';
  
 // CategoryDM category= CategoryDM(id: '', title: '', color: Color(0xffffff), imagePath: '');
 // Source source=Source();
  void changeNavigationIndex(int newIndex){
    navigationIndex=newIndex;
    notifyListeners();
  }
  void changeSearchIndex(int newIndex){
    searchIndex=newIndex;
    notifyListeners();
  }
  void changeSearchingState(){
    isSearching= !isSearching;
    notifyListeners();
  }
  void changeSearchNews(String news){
    searchNews=news;
    notifyListeners();
  }
/* void changeCategory(CategoryDM newCategory){
    category = newCategory;
    notifyListeners();
  }
  void changeSource(Source newSource){
    source=newSource;
    notifyListeners();
  }*/
}