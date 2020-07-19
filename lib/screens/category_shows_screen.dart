import 'package:flutter/material.dart';
import '../widgets/show_item.dart';
import '../data/data.dart';

class CategoryShowsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  // final Color categoryColor;

  // CategoryShowsScreen(this.categoryId, this.categoryTitle, this.categoryColor);

  static const routeName = '/category-shows';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryShows =
        SHOWS.where((show) => show.categories.contains(categoryId)).toList();
    // final categoryColor = routeArgs['color'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        // backgroundColor: categoryColor,
      ),
      body: ListView.builder(
          itemBuilder: (ctx, i) {
            return ShowItem(
              title: categoryShows[i].title,
              imageUrl: categoryShows[i].imageUrl,
              episodes: categoryShows[i].episodes.length,
              audience: categoryShows[i].audience,
            );
          },
          itemCount: categoryShows.length),
    );
  }
}
