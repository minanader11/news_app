import 'package:flutter/animation.dart';
import 'package:news_app/core/my_theme.dart';

class CategoryDM{
  String title;
  Color color;
  String imagePath;
  String id;
  CategoryDM({required this.id,required this.title,required this.color,required this.imagePath});
  static List<CategoryDM> categoriesList(){
    return [
      CategoryDM(id: 'sports', title: 'Sports', color: MyTheme.redColor, imagePath: 'assets/images/ball.png'),
      CategoryDM(id: 'general', title: 'General', color: MyTheme.darkBlue, imagePath: 'assets/images/Politics.png'),
      CategoryDM(id: 'health', title: 'Health', color: MyTheme.pinkColor, imagePath: 'assets/images/health.png'),
      CategoryDM(id: 'business', title: 'Business', color: MyTheme.brownColor, imagePath: 'assets/images/bussines.png'),
      CategoryDM(id: 'entertainment', title: 'Entertainment', color: MyTheme.lightBlue, imagePath: 'assets/images/environment.png'),
      CategoryDM(id: 'science', title: 'Science', color: MyTheme.yellowColor, imagePath: 'assets/images/science.png'),

    ];
  }
}