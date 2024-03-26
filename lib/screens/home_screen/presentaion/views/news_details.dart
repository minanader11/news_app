import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/screens/home_screen/data/models/newsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'newsDetails';
  News news;

  NewsDetails({required this.news});

  @override
  Widget build(BuildContext context) {
    String content = news.content??'';

//Removes everything after first '.'
   // String result = content.substring(0, content.indexOf('.'));
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
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              news.title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage!,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(//content.contains('.')?
                       // '$result ...' ?? '':
                          news.description??'',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [Spacer(),
                            TextButton(
                              onPressed: ()async {

                                  final Uri uri = Uri.parse(news.url??'');
                                  if (await canLaunchUrl(uri)) {
                                    launchUrl(uri);
                                  }

                              },
                              style: TextButton.styleFrom(
                                  foregroundColor: MyTheme.grayColor),
                              child: Row(
                                children: [
                                  Text('View Full Article'),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 40,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
