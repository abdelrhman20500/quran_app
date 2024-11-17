import 'package:flutter/material.dart';
import 'package:quran_app/Api/api_service.dart';
import 'package:quran_app/ui/screens/home/home_screen.dart';
import 'package:quran_app/ui/screens/splash/splash_screen.dart';

void main() {
  ApiService.getQuran();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        HomeScreen.routeName:(_)=>HomeScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}


