import 'package:appfurtos/app/modules/ocurrency/ocurrency_Page.dart';
import 'package:appfurtos/app/modules/ocurrency/ocurrency_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appfurtos/app/modules/ocurrency/stores/image_picker_store.dart';

import 'ocurrency_repository.dart';

class OcurrencyModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OcurrencyStore()),
    Bind.lazySingleton((i) => OcurrencyRepository()),
    Bind.lazySingleton((i) => ImagePickerStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const OcurrencyPage()),
  ];
}
