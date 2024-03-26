import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/screens/home_screen/data/models/sourcesResponse.dart';

class TabItem extends StatefulWidget {
  TabItem({required this.source,required this.isSelected});
   Source source;
  bool isSelected;
  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: MyTheme.primaryColor, width: 3),
          color: widget.isSelected
              ? MyTheme.primaryColor
              : MyTheme.whiteColor,
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        widget.source.name ?? '',
        style: widget.isSelected
            ? Theme.of(context).textTheme.bodySmall!.copyWith(
            color: MyTheme.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold)
            : Theme.of(context).textTheme.bodySmall!.copyWith(
            color: MyTheme.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
