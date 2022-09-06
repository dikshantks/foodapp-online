import 'dart:async';

import 'package:equatable/equatable.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? contact;
  final String? role;

  const User({
    this.role,
    required this.id,
    this.name,
    this.email,
    this.contact,
  });

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  User copywith({
    String? role,
    String? id,
    String? name,
    String? email,
    String? contact,
  }) {
    return User(
        role: role ?? this.role,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        contact: contact ?? this.contact);
  }

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
        role: snap['role'],
        id: snap.id,
        name: snap['name'],
        email: snap['useremail'],
        contact: snap['usercontact']);
  }

  Map<String, Object> toDocument() {
    return {
      'name': name!,
      'useremail': email!,
      'usercontact': contact!,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, contact, role];

  // StreamSubscription<User?> listen(Null Function(dynamic authuser) param0) {}
}
