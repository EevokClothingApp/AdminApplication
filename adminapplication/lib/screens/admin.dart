import 'package:adminapplication/screens/dashboard.dart';
import 'package:adminapplication/screens/manage.dart';
import 'package:flutter/material.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor inActive = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  setState(() {
                    _selectPage = Page.dashboard;
                  });
                },
                icon: Icon(
                  Icons.dashboard,
                  color: _selectPage == Page.dashboard ? active : inActive,
                ),
                label: Text("Dashboard"),
              ),
            ),
            Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  setState(() {
                    _selectPage = Page.manage;
                  });
                },
                icon: Icon(
                  Icons.sort,
                  color: _selectPage == Page.manage ? active : inActive,
                ),
                label: Text("Manage"),
              ),
            ),
          ],
        ),
      ),
      body: _selectPage == Page.dashboard ? Dashboard() : Manage(),
    );
  }
}
