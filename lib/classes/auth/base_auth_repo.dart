import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseauthRepo {
  Stream<auth.User?> get User;

  Future<auth.User?> Signup({
    required String emai,
    required String name,
    required String password,
    required String contact,
  });

  Future<void> loginwithEmailandPassword({
    required String emai,
    required String password,
  });

  Future<void> Signout();
}
