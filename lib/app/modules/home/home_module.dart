import 'package:appfurtos/app/modules/home/pages/edit_user_page.dart';
import 'package:appfurtos/app/modules/home/pages/search_textfield_store.dart';
import 'package:appfurtos/app/modules/home/pages/user_manager_page.dart';
import 'package:appfurtos/app/modules/home/stores/edit_user_image_picked_store.dart';
import 'package:appfurtos/app/modules/home/stores/edit_user_store.dart';
import 'package:appfurtos/app/modules/home/stores/user_manager_store.dart';
import 'package:appfurtos/app/modules/theft/theft_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appfurtos/app/modules/home/home_page.dart';
import 'package:appfurtos/app/modules/home/stores/home_store.dart';
import 'package:appfurtos/app/modules/login/pages/login_page.dart';
import 'package:appfurtos/app/modules/ocurrency/ocurrency_module.dart';
import 'home_repository.dart';
import 'stores/quantity_ocurrency_home_card_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => HomeRepository()),
    Bind.lazySingleton((i) => QuantityOcurrencyHomeCardStore()),
    Bind.lazySingleton((i) => EditUserImagePickerStore()),
    Bind.lazySingleton((i) => EditUserStore()),
    Bind.lazySingleton((i) => UserManagerStore()),
    Bind.lazySingleton((i) => SearchTextFieldStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HomePage(),
    ),
    ChildRoute('/login', child: (_, args) => const LoginPage()),
    ChildRoute('/edituser', child: (_, args) => const EditUserPage()),
    ChildRoute('/userManager', child: (_, args) => const UserManagerPage()),
    ModuleRoute('/ocurrency', module: OcurrencyModule()),
    ModuleRoute('/theft', module: TheftModule()),
  ];
}
