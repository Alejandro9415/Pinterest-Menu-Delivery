import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:servimotos_clinte/src/ui/screen/home.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 5000), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'DeliveryApp',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              AspectRatio(
                aspectRatio: 18 / 9,
                child: Lottie.asset('assets/splash.json'),
              ),
              Container(
                width: 150,
                height: 15,
                decoration: BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 30),
                      spreadRadius: 5)
                ]),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
