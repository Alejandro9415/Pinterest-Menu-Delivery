import 'package:flutter/material.dart';
import 'package:servimotos_clinte/src/ui/screen/home.dart';

import 'src/ui/screen/splash.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cliente',
      home: SplashPage()
    );
  }
}