import 'package:flutter/material.dart';
import 'package:quran_app/ui/screens/home/tabs/audio_tab.dart';
import 'package:quran_app/ui/screens/home/tabs/home_tab.dart';
import 'package:quran_app/ui/screens/home/tabs/settings_tab.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName= "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  List<Widget> tabs=
  [
    HomeTab(),
    AudioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, size: 32, color: Colors.black,),
        title: const Text("Al_Quran", style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (index){
            currentIndex =index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.audiotrack), label: "Audio"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ]),
      body: tabs[currentIndex],
    );
  }
}
