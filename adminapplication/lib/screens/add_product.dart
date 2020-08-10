import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  GlobalKey<FormState> _formKey;
  TextEditingController productNameController = TextEditingController();

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
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: null,
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 50.0),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: null,
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 50.0),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      onPressed: null,
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 50.0),
                        child: Icon(Icons.add),
                      ),
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
                autofocus: true,
                maxLength: 10,
                keyboardAppearance: Brightness.dark,
                controller: productNameController,
                decoration: InputDecoration(
                  hintText: 'Product Name',
                  floatingLabelBehavior: FloatingLabelBehavior.always
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'You must enter the product name';
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
