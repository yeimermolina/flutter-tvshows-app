import 'package:flutter/material.dart';
import '../screens/show_detail_screen.dart';
import '../models/show.dart';

class ShowItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int episodes;
  final Audience audience;

  ShowItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.episodes,
    @required this.audience,
  });

  String get audienceText {
    switch (audience) {
      case Audience.AllPublic:
        return 'All';
      case Audience.Children:
        return 'Kids';
      case Audience.Teenagers:
        return 'Teens';
      default:
        return '';
    }
  }

  void selectShow(BuildContext context) {
    Navigator.of(context).pushNamed(ShowDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectShow(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.layers),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$episodes episodes'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.people),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$audienceText'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
