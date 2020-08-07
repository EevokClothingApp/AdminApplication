import 'package:flutter/material.dart';

class Manage extends StatefulWidget {
  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  TextEditingController catController;
  GlobalKey<FormState> _catFormKey = GlobalKey();
  TextEditingController brandController;
  GlobalKey<FormState> _brandFormKey;

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
          onTap: () {
            createCategory();
          },
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
          onTap: () {
            createBrand();
          },
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

  void createCategory() {
    var alert = new AlertDialog(
      content: Form(
        key: _catFormKey,
        child: TextFormField(
          controller: catController,
          decoration: InputDecoration(hintText: "Category"),
          validator: (value) {
            if (value.isEmpty) {
              return 'Empty field';
            }
          },
        ),
      ),
      actions: <Widget>[
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Add"),
        ),
        FlatButton.icon(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          icon: Icon(Icons.close),
          label: Text("Close"),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

  void createBrand() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandFormKey,
        child: TextFormField(
          controller: catController,
          decoration: InputDecoration(hintText: "Brand"),
          validator: (value) {
            if (value.isEmpty) {
              return 'Empty field';
            }
          },
        ),
      ),
      actions: <Widget>[
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("Add"),
        ),
        FlatButton.icon(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          icon: Icon(Icons.close),
          label: Text("Close"),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
