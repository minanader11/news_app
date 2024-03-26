import 'package:flutter/material.dart';
import 'package:news_app/core/api_service.dart';
import 'package:news_app/core/category_provider.dart';
import 'package:news_app/core/custom_text_field.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';
import 'package:news_app/screens/home_screen/presentaion/views/categories_view.dart';
import 'package:news_app/screens/home_screen/presentaion/views/category_details_view.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/MyDrawer.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/settings_view.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/sources_tabbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var navigationProvider = Provider.of<NavigationProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )),
        Scaffold(
          drawer: MyDrawer(),
          appBar: //navigationProvider.searchIndex == 0 &&
          navigationProvider.navigationIndex== SettingsView.settingsView? null:
              navigationProvider.navigationIndex ==
                      CategoriesView.categoriesview
                  ? AppBar(
                      actions: navigationProvider.navigationIndex ==
                              CategoriesView.categoriesview
                          ? null
                          : [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {
                                      navigationProvider.changeSearchIndex(1);
                                      if( navigationProvider.isSearching==true){
                                      navigationProvider.changeSearchingState();
                                      }
                                    },
                                    icon: Icon(Icons.search)),
                              )
                            ],
                      centerTitle: true,
                      actionsIconTheme:
                          IconThemeData(color: MyTheme.whiteColor),
                      title: Text(
                        navigationProvider.navigationIndex ==
                                CategoriesView.categoriesview
                            ? 'News'

                        : categoryProvider.category.title,

                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: MyTheme.whiteColor),
                      ),
                    )
                  : navigationProvider.searchIndex == 1
                      ? AppBar(
                          title: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
                              margin: EdgeInsets.all(10),
                              child: CustomTextField(
                                label: 'search',
                                controller: searchController,
                                validator: (text) {

                                },
                              )),
                        )
                      : AppBar(
                          actions: navigationProvider.navigationIndex ==
                                  CategoriesView.categoriesview
                              ? null
                              : [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                        onPressed: () {
                                          navigationProvider
                                              .changeSearchIndex(1);
                                        },
                                        icon: Icon(Icons.search)),
                                  )
                                ],
                          centerTitle: true,
                          actionsIconTheme:
                              IconThemeData(color: MyTheme.whiteColor),
                          title: Text(
                            navigationProvider.navigationIndex ==
                                    CategoriesView.categoriesview
                                ? 'News'
                                : categoryProvider.category.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: MyTheme.whiteColor),
                          ),
                        ),
          backgroundColor: Colors.transparent,
          body: navigationProvider.navigationIndex ==
                  CategoriesView.categoriesview
              ? CategoriesView()
              : navigationProvider.navigationIndex ==
    CategoryDetailsView.categoriesDetailsView
          ?CategoryDetailsView()
          : SettingsView(),
        ),
      ],
    );
  }
}
