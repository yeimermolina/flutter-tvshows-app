import 'package:flutter/material.dart';
import '../data/data.dart';

class ShowDetailScreen extends StatelessWidget {
  static const routeName = '/show-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  ShowDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final showId = ModalRoute.of(context).settings.arguments as String;
    final selectedShow = SHOWS.firstWhere((show) => show.id == showId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedShow.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedShow.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Episodes'),
            buildContainer(
              ListView.builder(
                  itemCount: selectedShow.episodes.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(selectedShow.episodes[index]),
                      ),
                    );
                  }),
            ),
            buildSectionTitle(context, 'Cast'),
            buildContainer(
              ListView.builder(
                  itemCount: selectedShow.cast.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(selectedShow.cast[index]),
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(isFavorite(showId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(showId),
      ),
    );
  }
}
