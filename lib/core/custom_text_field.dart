import 'package:flutter/material.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.label,
      this.keyboardType = TextInputType.text,
      required this.controller,
      required this.validator,
      this.obscureText = false});

  String label;
  TextInputType keyboardType;
  TextEditingController controller;
  String? Function(String?) validator;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    var navigationProvider = Provider.of<NavigationProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        style: Theme.of(context).textTheme.bodySmall,
        decoration: InputDecoration(
          prefixIcon: InkWell(onTap: (){
            navigationProvider.changeSearchIndex(0);
            navigationProvider.changeSearchNews('');
            if(navigationProvider.isSearching==true){
            navigationProvider.changeSearchingState();}
          },child: Icon(Icons.close)),
          prefixIconColor: MyTheme.primaryColor,
          filled: true,
          fillColor: MyTheme.whiteColor,
          suffixIcon: InkWell(onTap: (){
            if(navigationProvider.isSearching==false){
            navigationProvider.changeSearchingState();}
            navigationProvider.changeSearchNews(controller.text);
            print(navigationProvider.searchNews);
          },child: Icon(Icons.search)),
          suffixIconColor: MyTheme.primaryColor,
          hintText: label,
          hintStyle:Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: MyTheme.primaryColor.withOpacity(0.2)) ,
          //label: Text(label,
            //  style: Theme.of(context)
               //   .textTheme
                //  .bodySmall!
                 // .copyWith(color: MyTheme.primaryColor.withOpacity(0.2))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
            borderSide: BorderSide(color: MyTheme.primaryColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
            borderSide: BorderSide(color: MyTheme.primaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
            borderSide: BorderSide(color: MyTheme.redColor, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
            borderSide: BorderSide(color: MyTheme.redColor, width: 2),
          ),
        ),
        keyboardType: keyboardType,
        controller: controller,

        obscureText: obscureText,
      ),
    );
  }
}
