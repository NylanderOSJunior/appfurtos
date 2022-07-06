import 'package:appfurtos/app/shared/arrow_back_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:appfurtos/app/core/models/user_model.dart';
import 'package:appfurtos/app/modules/signup/signup_store.dart';
import 'package:appfurtos/app/shared/background_widget.dart';
import 'package:appfurtos/app/shared/loading_widget.dart';

import 'package:flutter/material.dart';

import 'components/register_new_user_form.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends ModularState<SignupPage, SignupStore> {
  Widget _buildLoginBody() {
    return TripleBuilder<SignupStore, Exception, UserModel>(
      builder: (_, triple) {
        if (triple.isLoading) {
          return const LoadingWidget();
        }
        return const RegisterNewUserFormWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundWidget(),
          const ArrowBackWidget(),
          _buildLoginBody(),
        ],
      ),
    );
  }
}
