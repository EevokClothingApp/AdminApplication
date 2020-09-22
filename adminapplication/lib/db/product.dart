import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  Firestore _firestore = Firestore.instance;
  String ref = 'products';

  void createProduct(
      {String productName,
      String brand,
      String category,
      List images,
      double price,
      String description}) {
    var id = Uuid();
    String productId = id.v1();

    _firestore.collection(ref).document(productId).setData({
      'name': productName,
      'brand': brand,
      'id': productId,
      'category': category,
      'price': price,
      'description': description,
      'images' : images
    });
  }

  Future<List<DocumentSnapshot>> getProducts() {
    return _firestore.collection(ref).getDocuments().then((value) {
      return value.documents;
    });
  }
}
