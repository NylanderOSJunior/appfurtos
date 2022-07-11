import 'package:appfurtos/app/shared/arrow_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:appfurtos/app/core/models/user_model.dart';
import 'package:appfurtos/app/modules/home/components/user_form_widget.dart';
import 'package:appfurtos/app/modules/home/stores/edit_user_store.dart';
import 'package:appfurtos/app/shared/background_widget.dart';
import 'package:appfurtos/app/shared/loading_widget.dart';
import 'package:appfurtos/app/stores/user_store.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key? key}) : super(key: key);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final UserStore userStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TripleBuilder<EditUserStore, Exception, UserModel>(
        builder: (_, triple) {
          Widget popup = Container();
          if (triple.isLoading) {
            popup = const LoadingWidget();
          }
          return Stack(
            children: [
              const BackGroundWidget(),
              SafeArea(
                top: true,
                child: Column(
                  children: [
                    Text(
                      'Editar Perfil',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 100),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: UserFormWidget(user: userStore.state),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const ArrowBackWidget(),
              popup,
            ],
          );
        },
      ),
    );
  }
}
