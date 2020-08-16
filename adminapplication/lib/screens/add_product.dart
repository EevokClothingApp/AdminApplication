import 'dart:io';

import 'package:adminapplication/db/brand.dart';
import 'package:adminapplication/db/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  GlobalKey<FormState> _formKey;
  TextEditingController productNameController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory = 'No categories';
  String _currentBrand;
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  File _image1;
  File _image2;
  File _image3;

  _getCategories() async {
    List<DocumentSnapshot> data = await _categoryService.getCategory();
    setState(() {
      categories = data;
      categoriesDropDown = getCategoriesDropdown();
      _currentCategory = categories[0]['categoryName'];
    });
  }

  _getBrands() async {
    List<DocumentSnapshot> data = await _brandService.getBrands();
    setState(() {
      brands = data;
      brandsDropDown = getBrandsDropdown();
      _currentBrand = brands[0]['brandName'];
    });
  }

  changeSelectedCategory(String selectedCat) {
    setState(() {
      _currentCategory = selectedCat;
    });
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() {
      _currentBrand = selectedBrand;
    });
  }

  List<DropdownMenuItem<String>> getCategoriesDropdown() {
    List<DropdownMenuItem<String>> items = new List<DropdownMenuItem<String>>();
    //print(categories.length);
    categories.map((e) {
      items.add(
        new DropdownMenuItem(
          child: Text(e['categoryName']),
          value: e['categoryName'],
        ),
      );
    }).toList();
    return items;
  }

  List<DropdownMenuItem<String>> getBrandsDropdown() {
    List<DropdownMenuItem<String>> items = new List();
    for (DocumentSnapshot brand in brands) {
      items.add(
        new DropdownMenuItem(
          child: Text(brand['brandName']),
          value: brand['brandName'],
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Add Product",
          textAlign: TextAlign.center,
        ),
        leading: Icon(Icons.add),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: () {
                        _selectImage(
                            ImagePicker.pickImage(source: ImageSource.gallery),
                            1);
                      },
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      child: _displayChild1(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: () {
                        _selectImage(
                            ImagePicker.pickImage(source: ImageSource.gallery),
                            2);
                      },
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      child: _displayChild2(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: () {
                        _selectImage(
                            ImagePicker.pickImage(source: ImageSource.gallery),
                            3);
                      },
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      child: _displayChild3(),
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     "Enter Product Name",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 16.0),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                maxLength: 10,
                keyboardAppearance: Brightness.dark,
                controller: productNameController,
                decoration: InputDecoration(
                    hintText: 'Product Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'You must enter the product name';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DropdownButton(
                  isExpanded: true,
                  items: categoriesDropDown,
                  onChanged: changeSelectedCategory,
                  value: _currentCategory,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DropdownButton(
                  isExpanded: true,
                  items: brandsDropDown,
                  onChanged: changeSelectedBrand,
                  value: _currentBrand,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardAppearance: Brightness.dark,
                controller: productNameController,
                decoration: InputDecoration(
                    hintText: 'Product Description',
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'You must enter the product description';
                  }
                },
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            RaisedButton(
              elevation: 5.0,
              onPressed: () {},
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.red,
              child: Text(
                'Add Product',
                style: TextStyle(
                  color: Colors.black87,
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'openSans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _getCategories();
    _getBrands();
  }

  void _selectImage(Future<File> pickImage, int imgNum) async {
    File temp = await pickImage;

    if (imgNum == 1) {
      setState(() {
        _image1 = temp;
      });
    } else if (imgNum == 2) {
      setState(() {
        _image2 = temp;
      });
    } else if (imgNum == 3) {
      setState(() {
        _image3 = temp;
      });
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 50.0),
        child: Icon(Icons.add),
      );
    } else {
      return 
      //Padding
      (
        //padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 50.0),
        //child: 
        Image.file(_image1, fit: BoxFit.fill, width: double.infinity,)
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 50.0),
        child: Icon(Icons.add),
      );
    } else {
      return (
        //padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 50.0),
        //child: 
        Image.file(_image2, fit: BoxFit.fill, width: double.infinity,)
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 50.0),
        child: Icon(Icons.add),
      );
    } else {
      return 
      //Padding
      (
        //padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 50.0),
        //child: 
        Image.file(_image3, fit: BoxFit.fill, width: double.infinity,)
      );
    }
  }
}
