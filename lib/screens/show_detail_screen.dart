import 'package:flutter/material.dart';

class ShowDetailScreen extends StatelessWidget {
  static const routeName = '/show-detail';

  @override
  Widget build(BuildContext context) {
    final showId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('$showId'),),
      body: Center(
        child: Text('Hey - $showId'),
      ),
    );
  }
}
