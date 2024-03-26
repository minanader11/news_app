import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api_service.dart';
import 'package:news_app/core/app_config_provider.dart';
import 'package:news_app/core/category_provider.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:news_app/core/source_provider.dart';
import 'package:news_app/screens/home_screen/data/models/category_model.dart';
import 'package:news_app/screens/home_screen/data/models/newsResponse.dart';
import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';
import 'package:news_app/screens/home_screen/presentaion/views/manager/news_cubit/news_states.dart';
import 'package:news_app/screens/home_screen/presentaion/views/manager/news_cubit/news_view_model.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/news_item.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {


  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
 NewsViewModel newsViewModel=NewsViewModel();

  @override
  Widget build(BuildContext context) {
    var navigationProvider=Provider.of<NavigationProvider>(context);
   var sourceProvider=Provider.of<SourceProvider>(context);
    var categoryProvider=Provider.of<CategoryProvider>(context);
    var configProvider= Provider.of<AppConfigProvider>(context);
    newsViewModel.getNews(sourceProvider.source.id ??'', categoryProvider.category.id,configProvider.language);
    return BlocBuilder<NewsViewModel,NewsStates>(bloc: newsViewModel,builder: (context, state) {
      if(state is NewsLoadingState){
        return  Center(
          child: CircularProgressIndicator(
            color: MyTheme.primaryColor,
          ),
        );
      } else if(state is NewsFailureState){
        print('mina1');
        return   Expanded(
          child: Column(children: [
            Text(
             state.errorMessage,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            ElevatedButton(
                onPressed: () {
          
          
                },
                child: Text('Try again'))
          ]),
        );
      } else if(state is NewsSuccessState){
        return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => NewsItem(news: state.news[index]),
              itemCount: state.news.length,
            ));
      }
      return Container();
    },);
      /*FutureBuilder<NewsResponse>(
      future: ApiService.getNews(sourceProvider.source.id??'',categoryProvider.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.primaryColor,
            ),
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
                  ApiService.getNews(sourceProvider.source.id??'',categoryProvider.category.id);

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
                  ApiService.getNews(sourceProvider.source.id??'',categoryProvider.category.id);
                },
                child: Text('Try again'))
          ]);
        }
        var news = snapshot.data!.articles;

        return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => NewsItem(news: news[index]),
              itemCount: news!.length,
            ));
      },
    );*/
  }
}
