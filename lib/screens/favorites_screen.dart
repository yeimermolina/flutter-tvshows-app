import 'package:flutter/material.dart';
import '../models/show.dart';
import '../widgets/show_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Show> favoriteShows;

  FavoritesScreen(this.favoriteShows);

  @override
  Widget build(BuildContext context) {
    if (favoriteShows.isEmpty) {
      return Center(
        child: Text('You have no favorites yet'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, i) {
            return ShowItem(
              id: favoriteShows[i].id,
              title: favoriteShows[i].title,
              imageUrl: favoriteShows[i].imageUrl,
              episodes: favoriteShows[i].episodes.length,
              audience: favoriteShows[i].audience,
            );
          },
          itemCount: favoriteShows.length);
    }
  }
}
