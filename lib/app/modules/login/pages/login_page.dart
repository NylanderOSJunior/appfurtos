import 'dart:developer';

import 'package:appfurtos/app/shared/background_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../stores/login_store.dart';
import 'package:appfurtos/app/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:appfurtos/app/shared/commom_dialog.dart';
import 'package:appfurtos/app/shared/common_button_widget.dart';
import 'package:appfurtos/app/shared/loading_widget.dart';
import 'package:appfurtos/app/shared/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Tela de Login'}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Widget loading = Container();
    return Scaffold(
      body: TripleBuilder<LoginStore, Exception, UserModel>(
        store: store,
        builder: (_, triple) {
          if (triple.isLoading) {
            loading = const LoadingWidget();
          }
          return Stack(
            children: [
              const BackGroundWidget(),
              _buildLoginBody(),
              loading,
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoginBody() {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.login),
                    label: 'Usuário',
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Este campo não pode ser vazio';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock),
                    label: 'Senha',
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Este campo não pode ser vazio';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        'Recuperar Senha',
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.subtitle2!.fontSize,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/passwordRecover');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    child: Text(
                      'Não tem cadastro? Então cadastre-se!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.subtitle2!.fontSize,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                  ),
                  TripleBuilder<LoginStore, Exception, UserModel>(
                    builder: (_, triple) {
                      return CommonButtonWidget(
                        onTap: store.isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  await store.login().then(
                                    (value) {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/home/');
                                    },
                                  ).catchError(
                                    (onError) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const CommomDialog(
                                            message:
                                                'Erro ao tentar realizar o login, por favor verifique se o usuário e senha estão corretos!',
                                          );
                                        },
                                      );
                                    },
                                  );
                                }
                              },
                        label: 'Login',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DeviceOrientation {}
