import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appfurtos/app/core/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppFurtos',
      theme: theme,
    ).modular();
  }
}
