import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:tmp_online/components/constants.dart';

class Products extends Equatable {
  final String name;
  final String imgURl;
  final int price;
  final String uid;

  const Products({
    this.uid = '',
    required this.imgURl,
    required this.name,
    required this.price,
  });

  static Products fromSnapshot(DocumentSnapshot snap) {
    Products product = Products(
        uid: snap['menu_id'],
        imgURl: snap['image_url'],
        name: snap['item_name'],
        price: snap['price']);

    return product;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, price, imgURl];
}
