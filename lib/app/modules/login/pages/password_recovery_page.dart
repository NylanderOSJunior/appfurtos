import 'package:appfurtos/app/shared/arrow_back_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:appfurtos/app/core/models/user_model.dart';
import 'package:appfurtos/app/modules/login/stores/login_store.dart';
import 'package:appfurtos/app/shared/background_widget.dart';
import 'package:appfurtos/app/shared/commom_dialog.dart';
import 'package:appfurtos/app/shared/common_button_widget.dart';
import 'package:appfurtos/app/shared/loading_widget.dart';
import 'package:appfurtos/app/shared/textfield_widget.dart';

class PasswordRecoverPage extends StatefulWidget {
  const PasswordRecoverPage({Key? key}) : super(key: key);

  @override
  _PasswordRecoverPageState createState() => _PasswordRecoverPageState();
}

class _PasswordRecoverPageState extends State<PasswordRecoverPage> {
  TextEditingController emailTextController = TextEditingController();
  final LoginStore store = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TripleBuilder<LoginStore, Exception, UserModel>(
        store: store,
        builder: (_, triple) {
          Widget loading = Container();

          if (triple.isLoading) {
            loading = const LoadingWidget();
          }
          return Stack(
            children: [
              const BackGroundWidget(),
              const ArrowBackWidget(),
              Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Esqueceu a sua senha?',
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .fontSize,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                              child: Divider(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              'Digite seu e-mail, enviaremos uma solicitação para a troca de sua senha:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .fontSize,
                                color: Theme.of(context).primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Form(
                              key: _formKey,
                              child: TextFieldWidget(
                                controller: emailTextController,
                                textInputType: TextInputType.emailAddress,
                                prefixIcon: const Icon(Icons.home),
                                label: 'E-mail',
                                onSaved: (email) {
                                  emailTextController.text = email.toString();
                                },
                                validator: (text) {
                                  if (text!.isEmpty ||
                                      !text.contains('@') ||
                                      !text.contains('.')) {
                                    return 'E-mail inválido';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              child: TextButton(
                                child: const Text(
                                  'Enviar E-mail',
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              loading
            ],
          );
        },
      ),
    );
  }
}
