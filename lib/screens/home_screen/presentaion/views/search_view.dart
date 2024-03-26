import 'package:flutter/material.dart';
import 'package:news_app/core/api_service.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:news_app/screens/home_screen/data/models/newsResponse.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/news_item.dart';

import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    var navigationProvider = Provider.of<NavigationProvider>(context);
    return navigationProvider.isSearching == false
        ? Column()
        : //Column(children: [Center(child: Text(navigationProvider.searchNews),)],);
    FutureBuilder<NewsResponse>(
            future: ApiService.getSearchedNews(navigationProvider.searchNews),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        color: MyTheme.primaryColor,
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Column(children: [
                  Text(
                    'Something went wrong',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ApiService.getSearchedNews(
                            navigationProvider.searchNews);
                      },
                      child: Text('Try again'))
                ]);
              } else if (snapshot.data!.status != 'ok') {
                return Column(children: [
                  Text(snapshot.data?.message ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  ElevatedButton(
                      onPressed: () {
                        ApiService.getSearchedNews(
                            navigationProvider.searchNews);
                      },
                      child: Text('Try again'))
                ]);
              }
              var news = snapshot.data!.articles;

              return Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => NewsItem(
                  news: news[index],
                ),
                itemCount: news!.length,
              ));
            },
          );
  }
}
