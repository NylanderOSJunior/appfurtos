import 'package:flutter_triple/flutter_triple.dart';
import 'package:appfurtos/app/core/models/user_model.dart';

class UserStore extends NotifierStore<Exception, UserModel> {
  UserStore() : super(UserModel(isAdmin: true));
}
