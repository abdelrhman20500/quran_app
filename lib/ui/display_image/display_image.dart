import 'package:flutter/material.dart';
import '../../models/quran_model/quran_model.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key, required this.surahNumber, required this.surahs});

  final int surahNumber;
  final Surahs surahs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          surahs.name!,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: surahs.ayahs!.length,
        itemBuilder: (context, index) {
          final ayah = surahs.ayahs![index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('${ayah.text!.trim()}(${ayah.numberInSurah})',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}