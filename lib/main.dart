import 'package:flutter/material.dart';
import 'package:quran_app/ui/screens/home/home_screen.dart';
import 'package:quran_app/ui/screens/splash/splash_screen.dart';
import 'package:quran_app/ui/utils/app_theme.dart';

void main() {
  print("#######");
  // ApiService.getSurahAudio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        HomeScreen.routeName:(_)=>HomeScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
