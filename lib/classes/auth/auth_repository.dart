// import 'package:firebase_auth/firebase_auth.dart';
import 'package:tmp_online/classes/auth/base_auth_repo.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../usermodal/user_modal.dart';

class AuthRepo {
  final auth.FirebaseAuth _firebaseauth;

  AuthRepo({auth.FirebaseAuth? firebaseAuth})
      : _firebaseauth = firebaseAuth ?? auth.FirebaseAuth.instance;

  var currentUser = User.empty;

  Stream<User> get user {
    return _firebaseauth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }

  // @override
  Future<void> signout() async {
    await Future.wait([_firebaseauth.signOut()]);
  }

  // @override
  Future<auth.User?> signup(
      {required String emai,
      required String name,
      required String password,
      required String contact}) async {
    try {
      final credential = await _firebaseauth.createUserWithEmailAndPassword(
        email: emai,
        password: password,
      );

      final user = credential.user;

      return user;
    } catch (_) {}
  }

  // @override
  // // Stream<auth.User?> get User => _firebaseauth.userChanges();

  // @override
  Future<void> loginwithEmailandPassword({
    required String emai,
    required String password,
  }) async {
    try {
      await _firebaseauth.signInWithEmailAndPassword(
        email: emai,
        password: password,
      );
    } catch (_) {}
  }
}

extension on auth.User {
  User get toUser {
    return User(
      contact: phoneNumber,
      id: uid,
      email: email,
      name: displayName,
    );
  }
}
