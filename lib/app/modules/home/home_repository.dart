import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:appfurtos/app/core/models/ocurrency_model.dart';
import 'package:appfurtos/app/core/models/user_model.dart';

class HomeRepository extends Disposable {
  Future<List<OcurrencyModel>> getOcurrencies(String userId) async {
    List<OcurrencyModel> ocurrencies = [];

    return ocurrencies;
  }

  Future<UserModel> editUser(UserModel newUser, File image) async {
    return newUser;
  }

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];

    return users;
  }

  Future<List<UserModel>> getFilteredUsers(String name) async {
    List<UserModel> users = [];
    UserModel userModel;

    return users;
  }

  Future<void> updateUser(UserModel user) async {}

  @override
  void dispose() {}
}
