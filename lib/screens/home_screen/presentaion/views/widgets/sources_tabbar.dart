import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/api_service.dart';
import 'package:news_app/core/category_provider.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:news_app/core/source_provider.dart';
import 'package:news_app/screens/home_screen/data/models/category_model.dart';
import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/news_list.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/tab_item.dart';
import 'package:provider/provider.dart';

class SourcesTabBar extends StatefulWidget {
  List<Source> sources;

  SourcesTabBar({required this.sources});

  @override
  State<SourcesTabBar> createState() => _SourcesTabBarState();
}

class _SourcesTabBarState extends State<SourcesTabBar> {
  int selectedIndex = 0;
  //var sourceProvider=SourceProvider();


// SourceProvider sourceProvider=SourceProvider();
@override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   sourceProvider.changeSource(widget.sources[selectedIndex]);
  // }

  Widget build(BuildContext context) {
    var sourceProvider=Provider.of<SourceProvider>(context);


 // navigationProvider.changeSourceId(widget.sources[selectedIndex].id??'');
  //if(sourceProvider.source.id==null){
   //sourceProvider.changeSource(widget.sources[0]);
   // print('mina');
 // }
  if(sourceProvider.source!= widget.sources[selectedIndex]){
    sourceProvider.changeSource(widget.sources[selectedIndex]);
  }

    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            onTap: (value) {
              selectedIndex = value;
              //sourceProvider.changeSource(widget.sources[selectedIndex]);
             // navigationProvider.changeSourceId(widget.sources[selectedIndex].id ?? '');
              //navigationProvider.categoryId=widget.sources[selectedIndex].id ??'';
              // ApiService.getNews(navigationProvider.sourceId, navigationProvider.categoryId);
             // widget.onClickTabBar;

              setState(() {});
            },
            tabs: widget.sources
                .map(
                  (source) => TabItem(source: source, isSelected: selectedIndex==widget.sources.indexOf(source))
                )
                .toList(),
          ),
          NewsList(),
        ],
      ),
    );
  }
}
