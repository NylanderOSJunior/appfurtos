import 'dart:convert';

class UserModel {
  late String? id;
  late String? name = 'nylander';
  late String? username = 'nylander';
  late String? avatarUrl = 'nylander';
  late String? email = 'nylander@hotmail.com';
  late bool? isAdmin = true;
  late String? address = 'nylander';
  UserModel({
    this.id,
    this.name,
    this.username,
    this.avatarUrl,
    this.email,
    this.isAdmin,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'avatarUrl': avatarUrl,
      'email': email,
      'isAdmin': isAdmin,
      'address': address
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      username: map['username'],
      avatarUrl: map['avatarUrl'],
      email: map['email'],
      isAdmin: map['isAdmin'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
