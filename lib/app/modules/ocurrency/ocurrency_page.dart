import 'package:appfurtos/app/shared/arrow_back_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appfurtos/app/modules/ocurrency/components/ocurrency_form_widget.dart';
import 'package:appfurtos/app/modules/ocurrency/ocurrency_store.dart';
import 'package:flutter/material.dart';
import 'package:appfurtos/app/shared/background_widget.dart';

class OcurrencyPage extends StatefulWidget {
  final String title;
  const OcurrencyPage({Key? key, this.title = 'OcurrencyPage'})
      : super(key: key);
  @override
  OcurrencyPageState createState() => OcurrencyPageState();
}

class OcurrencyPageState extends State<OcurrencyPage> {
  final OcurrencyStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BackGroundWidget(),
        const ArrowBackWidget(),
        SafeArea(
          top: true,
          child: Container(
            margin: const EdgeInsets.only(top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: const OcurrencyFormWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
