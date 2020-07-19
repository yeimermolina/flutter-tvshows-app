import 'package:flutter/material.dart';
import '../widgets/show_item.dart';
import '../models/show.dart';
import '../data/data.dart';

class CategoryShowsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  // final Color categoryColor;

  // CategoryShowsScreen(this.categoryId, this.categoryTitle, this.categoryColor);

  static const routeName = '/category-shows';
  final List<Show> availableShows;

  CategoryShowsScreen(this.availableShows);

  @override
  _CategoryShowsScreenState createState() => _CategoryShowsScreenState();
}

class _CategoryShowsScreenState extends State<CategoryShowsScreen> {
  String categoryTitle;
  List<Show> categoryShows;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryShows =
          widget.availableShows.where((show) => show.categories.contains(categoryId)).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeShow(String showId) {
    setState(() {
      print(showId);
      categoryShows.removeWhere((show) => show.id == showId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final categoryColor = routeArgs['color'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        // backgroundColor: categoryColor,
      ),
      body: ListView.builder(
          itemBuilder: (ctx, i) {
            return ShowItem(
              id: categoryShows[i].id,
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
