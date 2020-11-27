import 'package:flutter/material.dart';
import 'package:servimotos_clinte/src/ui/widgets/menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 30,
            child: Container(
              width: width,
              child: Align(
                child: MenuWidget(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
