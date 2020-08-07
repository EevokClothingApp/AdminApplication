import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTest {
    final databaseReference = Firestore.instance;

  void createRecord() async {
    await databaseReference.collection("books").document("2").setData({
      'title': 'Mastering Flutter',
      'description': 'Programming Guide for Dart'
    });

    DocumentReference ref = await databaseReference.collection("books").add({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
    print(ref.documentID);
  }
}