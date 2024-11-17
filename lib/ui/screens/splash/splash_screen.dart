import 'package:flutter/material.dart';

import '../home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName ="SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushNamed(context, HomeScreen.routeName);
    });  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        child: Image.asset("assets/images/quranLogo.jpg",
            fit: BoxFit.fill),
      ),
    );
  }
}
