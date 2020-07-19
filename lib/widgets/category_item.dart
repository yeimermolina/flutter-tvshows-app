import 'package:flutter/material.dart';
import '../screens/category_shows_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void goToCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryShowsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryShowsScreen(id, title, color);
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
