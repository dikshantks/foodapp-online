import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tmp_online/classes/menu_items/menu_item_model.dart';
import 'package:tmp_online/classes/menu_items/repository/base_product_repo.dart';

class ProductRepo extends BaseProductRepo {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Products>> getAllProducts() {
    return _firebaseFirestore.collection('').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Products.fromSnapshot(doc)).toList();
    });
  }
}
