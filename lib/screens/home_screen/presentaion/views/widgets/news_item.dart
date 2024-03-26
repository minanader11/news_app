import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/screens/home_screen/data/models/newsResponse.dart';
import 'package:news_app/screens/home_screen/presentaion/views/news_details.dart';

class NewsItem extends StatelessWidget {
  NewsItem({required this.news});

  News news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewsDetails(news: news),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: //Image.network(
                    // news.urlToImage ?? '',
                    //),
                    CachedNetworkImage(
                  imageUrl: news.urlToImage!,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Container(height: MediaQuery.of(context).size.height*0.2,child: Icon(Icons.error,size: 40,)),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              news.source?.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: MyTheme.grayColor),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              news.publishedAt ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: MyTheme.grayColor),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
