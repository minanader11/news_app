import 'package:flutter/material.dart';
import 'package:news_app/core/category_provider.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:news_app/core/source_provider.dart';
import 'package:news_app/screens/home_screen/data/models/category_model.dart';
import 'package:news_app/screens/home_screen/presentaion/views/category_details_view.dart';
import 'package:news_app/screens/home_screen/presentaion/views/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  var categoriesList = CategoryDM.categoriesList();
  static int categoriesview= 1;
  @override
  Widget build(BuildContext context) {
    var navigationProvider=Provider.of<NavigationProvider>(context);
    var sourceProvider=Provider.of<SourceProvider>(context);
    var categoryProvider=Provider.of<CategoryProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category \nof interest',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      navigationProvider.changeNavigationIndex(CategoryDetailsView.categoriesDetailsView);
                      categoryProvider.changeCategory(categoriesList[index]);
                    },
                    child: CategoryItem(
                      category: categoriesList[index],
                      index: index,
                    ));
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
