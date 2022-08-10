import 'package:tmp_online/classes/auth/base_auth_repo.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepo extends BaseauthRepo {
  final auth.FirebaseAuth _firebaseauth;

  AuthRepo({auth.FirebaseAuth? firebaseAuth})
      : _firebaseauth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<void> Signout() async {
    await _firebaseauth.signOut();
  }

  @override
  Future<auth.User?> Signup(
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
    } catch (e) {}
  }

  @override
  // TODO: implement User
  Stream<auth.User?> get User => _firebaseauth.userChanges();

  @override
  Future<void> loginwithEmailandPassword({
    required String emai,
    required String password,
  }) async {
    try {
      await _firebaseauth.signInWithEmailAndPassword(
        email: emai,
        password: password,
      );
    } catch (e) {}
  }
}
