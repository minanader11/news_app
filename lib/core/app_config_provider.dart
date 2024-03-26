import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier
{


  String language='en';
  void changeLanguage(String newLanguage)async {
    language=newLanguage;
    notifyListeners();
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setString('lang', newLanguage);
  }
  Future<void> getLang()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String? lang =prefs.getString('lang');
    if(lang != null){
      language=lang;
      notifyListeners();
    }
  }


}