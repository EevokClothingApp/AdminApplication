import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          subtitle: FlatButton.icon(onPressed: () {}, icon: null, label: null),
        )
      ],
    );
  }
}