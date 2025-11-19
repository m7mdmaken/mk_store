import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
  final String email;
  final String name;
  final String uId;

  Map<String, String> toMap() {
    return {'email': email, 'name': name, 'uId': uId};
  }

  UserEntity({required this.email, required this.name, required this.uId});
  factory UserEntity.fromFirebaseUser({required User user}) {
    return UserEntity(
      email: user.email ?? ' No Email',
      name: user.displayName ?? ' No Name',
      uId: user.uid,
    );
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      uId: map['uId'] ?? '',
    );
  }
}
