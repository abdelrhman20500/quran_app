import 'package:flutter/material.dart';
import 'package:quran_app/ui/screens/home/home_screen.dart';
import 'package:quran_app/ui/screens/splash/splash_screen.dart';

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
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        HomeScreen.routeName:(_)=>HomeScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}


// ListView.builder(
//   itemCount: surahs.ayahs!.length,
//   itemBuilder: (context, index) {
//     final ayah = surahs.ayahs![index];
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//       child: Text('${ayah.text!.trim()}(${ayah.numberInSurah})',
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontSize: 16),
//       ),
//     );
//   },
// ),
