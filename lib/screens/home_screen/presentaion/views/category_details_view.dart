import 'package:flutter/material.dart';
import 'package:news_app/core/api_service.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:news_app/screens/home_screen/data/models/newsResponse.dart';
import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';
import 'package:news_app/screens/home_screen/presentaion/views/search_view.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/news_item.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/news_list.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/sources.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/sources_tabbar.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key});
  static int categoriesDetailsView= 2;
  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {

  @override
  Widget build(BuildContext context) {
    var navigationProvider = Provider.of<NavigationProvider>(context);
    return Column(
      children: [
         navigationProvider.searchIndex==0?
        SourcesView(): SearchView(),
        //NewsList()

      ],
    );
  }
}
