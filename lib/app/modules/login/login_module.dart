import 'package:appfurtos/app/modules/home/home_module.dart';
import 'package:appfurtos/app/modules/signup/signup_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'stores/login_store.dart';

import 'pages/login_page.dart';
import 'pages/password_recovery_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute('/passwordRecover',
        child: (_, args) => const PasswordRecoverPage()),
    ModuleRoute(
      '/signup',
      module: SignupModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/home',
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
