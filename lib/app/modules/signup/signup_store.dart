import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:appfurtos/app/core/models/user_model.dart';

class SignupStore extends NotifierStore<Exception, UserModel> {
  SignupStore() : super(UserModel(isAdmin: false));

  Future<void> signup(String password) async {
    setLoading(true);
  }

  void updateForm(UserModel model) {
    update(model);
  }
}
