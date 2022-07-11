import 'package:flutter_modular/flutter_modular.dart';

import 'package:appfurtos/app/modules/theft/theft_page.dart';
import 'package:appfurtos/app/modules/theft/stores/image_picked_store.dart';
import 'package:appfurtos/app/modules/theft/stores/theft_store.dart';

import 'theft_repository.dart';

class TheftModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TheftStore()),
    Bind.lazySingleton((i) => PostRepository()),
    Bind.lazySingleton((i) => ImagePickerStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TheftPage()),
  ];
}
