import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({required this.category, required this.index});

  CategoryDM category;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: index % 2 == 0 ? Radius.circular(20) : Radius.circular(0),
          bottomRight:
              index % 2 == 0 ? Radius.circular(0) : Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * 0.15,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
