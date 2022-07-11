import 'package:appfurtos/app/shared/arrow_back_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:appfurtos/app/modules/theft/components/theft_form_widget.dart';
import 'package:appfurtos/app/modules/theft/stores/theft_store.dart';
import 'package:appfurtos/app/shared/background_widget.dart';

class TheftPage extends StatefulWidget {
  final String title;
  const TheftPage({Key? key, this.title = 'TheftPage'}) : super(key: key);
  @override
  PostPageState createState() => PostPageState();
}

class PostPageState extends State<TheftPage> {
  final TheftStore store = Modular.get();

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
                          child: const TheftFormWidget(),
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
