import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          subtitle: FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.attach_money,
              size: 30.0,
              color: Colors.green,
            ),
            label: Text(
              "12,000",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.green,
              ),
            ),
          ),
          title: Text(
            "Revanue",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0, color: Colors.grey),
          ),
        ),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.people_outline),
                      label: Text("Users"),
                    ),
                    subtitle: Text(
                      "7",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 60.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.category),
                      label: Text("Categories"),
                    ),
                    subtitle: Text(
                      "10",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 60.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.track_changes),
                      label: Text("Products"),
                    ),
                    subtitle: Text(
                      "70",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 60.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.face),
                      label: Text("Sold"),
                    ),
                    subtitle: Text(
                      "20",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 60.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.shopping_cart),
                      label: Text("Orders"),
                    ),
                    subtitle: Text(
                      "20",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 60.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.close),
                      label: Text("Returns"),
                    ),
                    subtitle: Text(
                      "0",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 60.0),
                    ),
                  ),
                ),
              ),
              // FloatingActionButton(
              //   child: Icon(Icons.add),
              //   onPressed: () {
              //     fb.createRecord();
              //   },
              // ),
            ],
          ),
        )
      ],
    );
  }
}
