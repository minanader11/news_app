import 'package:flutter/material.dart';
import 'package:news_app/core/api_service.dart';
import 'package:news_app/core/category_provider.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:news_app/core/source_provider.dart';
import 'package:news_app/screens/home_screen/data/models/category_model.dart';
import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/sources_tabbar.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {


  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {

  @override
  Widget build(BuildContext context) {
    var navigationProvider=Provider.of<NavigationProvider>(context);
    var sourceProvider=Provider.of<SourceProvider>(context);
    var categoryProvider=Provider.of<CategoryProvider>(context);

   return FutureBuilder<SourcesResponse>(
      future: ApiService.getSources(categoryProvider.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: MyTheme.primaryColor,),
          );
        } else if (snapshot.hasError) {
          return Column(children: [
            Text('Something went wrong'),
            ElevatedButton(
                onPressed: () {
                  ApiService.getSources(categoryProvider.category.id);
                },
                child: Text('Try again'))
          ]);
        } else if (snapshot.data!.status != 'ok') {
          return Column(children: [
            Text(snapshot.data?.message ?? ''),
            ElevatedButton(
                onPressed: () {
                  ApiService.getSources(categoryProvider.category.id);
                },
                child: Text('Try again'))
          ]);
        }
        var sources = snapshot.data!.sources;
         //sourceProvider.changeSource(sources![0]);
        /*return ListView.builder(
              itemBuilder: (context, index) {
                  return Text(sources[index].name ?? '' , style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),);
                },
                itemCount: sources!.length,
              );*/
        return Expanded(child: SourcesTabBar(sources: sources!,));
      },
    );
  }
}
