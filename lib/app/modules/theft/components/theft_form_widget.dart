import 'package:appfurtos/app/modules/theft/components/image_picked_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:appfurtos/app/modules/theft/stores/image_picked_store.dart';
import 'package:appfurtos/app/modules/theft/stores/theft_store.dart';
import 'package:appfurtos/app/modules/theft/components/image_picked_widget.dart';
import 'package:appfurtos/app/shared/commom_dialog.dart';
import 'package:appfurtos/app/shared/common_button_widget.dart';
import 'package:appfurtos/app/shared/textfield_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TheftFormWidget extends StatefulWidget {
  const TheftFormWidget({Key? key}) : super(key: key);

  @override
  State<TheftFormWidget> createState() => _TheftFormWidgetState();
}

class _TheftFormWidgetState extends State<TheftFormWidget> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController codeController = TextEditingController();
    final TextEditingController statusController = TextEditingController();
    XFile? photo = XFile('');
    final ImagePicker imagePicker = ImagePicker();
    File photoToFile = File('');
    final ImagePickerStore imagePickerStore = Modular.get();
    final TheftStore store = Modular.get();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              photo = await imagePicker.pickImage(source: ImageSource.gallery);

              photoToFile = File(photo!.path);
              imagePickerStore.update(photoToFile);
            },
            child: TripleBuilder<ImagePickerStore, Exception, File>(
              builder: (_, triple) {
                return ImagePickedCardWidget(file: triple.state);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldWidget(
            textInputType: TextInputType.text,
            prefixIcon: const Icon(Icons.emoji_objects),
            label: 'Nome do Usuario: ',
            controller: emailController,
            onSaved: (email) {
              emailController.text = email.toString();
            },
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
            prefixIcon: const Icon(Icons.code),
            label: 'Modelo do Equipamento: ',
            controller: codeController,
            onSaved: (code) {
              codeController.text = code.toString();
            },
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
            prefixIcon: const Icon(Icons.code),
            label: 'Marca do Equipamento: ',
            controller: codeController,
            onSaved: (code) {
              codeController.text = code.toString();
            },
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
            prefixIcon: const Icon(Icons.list_alt),
            label: 'Numero para Contato',
            controller: passwordController,
            onSaved: (password) {
              passwordController.text = password.toString();
            },
            validator: (text) {
              if (text!.isEmpty) {
                return 'Este campo não pode ser vazio';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldWidget(
            prefixIcon: const Icon(Icons.list_alt),
            label: 'Descrição do Ocorrido: ',
            controller: passwordController,
            onSaved: (password) {
              passwordController.text = password.toString();
            },
            validator: (text) {
              if (text!.isEmpty) {
                return 'Este campo não pode ser vazio';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CommonButtonWidget(
            onTap: store.isLoading
                ? null
                : () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await store
                          .registerTheft()
                          .then(
                            (value) {},
                          )
                          .catchError(
                        (onError) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const CommomDialog(
                                message:
                                    'Erro ao tentar criar uma nova ocorrência!',
                              );
                            },
                          );
                        },
                      );
                    }
                  },
            label: 'Cadastrar Ocorrencia',
          ),
        ],
      ),
    );
  }
}
