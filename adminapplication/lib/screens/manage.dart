import 'package:flutter/material.dart';

class Manage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Add Products"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.change_history),
          title: Text("Products List"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle),
          title: Text("Add Category"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.category),
          title: Text("Category List"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle_outline),
          title: Text("Add Brand"),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.library_books),
          title: Text("Brand List"),
          onTap: () {},
        ),
        Divider(),
      ],
    );
  }
}