import 'package:flutter/material.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:news_app/screens/home_screen/presentaion/views/categories_view.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/settings_view.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var navigationProvider=Provider.of<NavigationProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.7,
            color: MyTheme.primaryColor,
            child: Center(child: Text('News App!', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyTheme.whiteColor),)),
          ),
          SizedBox(height: 10,),
          InkWell(onTap: (){
            navigationProvider.changeNavigationIndex(CategoriesView.categoriesview);
            navigationProvider.changeSearchNews('');
            if(navigationProvider.isSearching==true){
            navigationProvider.changeSearchingState();
            }
            navigationProvider.changeSearchIndex(0);
            Navigator.of(context).pop();
          },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 34,
                ),SizedBox(width: 5,),
                Text(
                  'Categories',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          InkWell(onTap: (){
            navigationProvider.changeNavigationIndex(SettingsView.settingsView);
            navigationProvider.changeSearchNews('');
            if(navigationProvider.isSearching==true){
              navigationProvider.changeSearchingState();
            }
            navigationProvider.changeSearchIndex(0);
            Navigator.of(context).pop();
          },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 34,
                ),SizedBox(width: 5,),
                Text(
                  'Settings',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
