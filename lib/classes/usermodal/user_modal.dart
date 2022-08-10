import 'package:equatable/equatable.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class User extends Equatable {
  final String? id;
  final String name;
  final String email;
  final String contact;

  final String? role;

  User({
    this.role,
    this.id,
    required this.name,
    required this.email,
    required this.contact,
  });

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
      'name': name,
      'useremail': email,
      'usercontact': contact,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, contact];
}
