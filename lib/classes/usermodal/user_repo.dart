import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tmp_online/classes/usermodal/base_user_auth.dart';
import 'package:tmp_online/classes/usermodal/user_modal.dart';

class userRepo extends BaseUserRepo {
  final FirebaseFirestore _firebasefirestore;

  userRepo({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebasefirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(User user) async {
    await _firebasefirestore
        .collection('users')
        .doc(user.id)
        .set(user.toDocument());
  }

  @override
  Stream<User> getUser(String id) {
    print('getting user data form firebase ');

    return _firebasefirestore.collection('users').doc(id).snapshots().map(
          (snap) => User.fromSnapshot(snap),
        );
  }

  @override
  Future<void> updateUser(User user) async {
    return _firebasefirestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then((value) => print('User document changed '));
  }
}
