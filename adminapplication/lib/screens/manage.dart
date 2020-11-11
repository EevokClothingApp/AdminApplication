import 'package:adminapplication/db/brand.dart';
import 'package:adminapplication/db/category.dart';
import 'package:adminapplication/screens/inner_screens/add_product.dart';
import 'package:adminapplication/screens/inner_screens/brands.dart';
import 'package:adminapplication/screens/inner_screens/categories.dart';
import 'package:adminapplication/screens/inner_screens/products.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Manage extends StatefulWidget {
  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  TextEditingController catController = TextEditingController();
  GlobalKey<FormState> _catFormKey = GlobalKey();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _brandFormKey;
  BrandService _brandService = BrandService();
  CategoryService _categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Add Products"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddProduct(),
              ),
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.change_history),
          title: Text("Products List"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Products(),
              ),
            );
          },
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Categories(),
              ),
            );
          },
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Brands(),
              ),
            );
          },
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
          autofocus: true,
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
          onPressed: () {
            if (catController.text != null) {
              _categoryService.createCategory(catController.text);
              catController.text = '';
            }
            Fluttertoast.showToast(msg: 'Category created');
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
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
          autofocus: true,
          controller: brandController,
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
          onPressed: () {
            if (brandController.text.isNotEmpty) {
              _brandService.createBrand(brandController.text);
            }
            Fluttertoast.showToast(msg: 'Brand created');
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
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
