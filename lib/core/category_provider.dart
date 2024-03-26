import 'package:flutter/cupertino.dart';
import 'package:news_app/screens/home_screen/data/models/category_model.dart';

class CategoryProvider extends ChangeNotifier{
  CategoryDM category= CategoryDM(id: '', title: '', color: Color(0xffffff), imagePath: '');
  void changeCategory(CategoryDM newCategory){
    category = newCategory;
    notifyListeners();
  }
}