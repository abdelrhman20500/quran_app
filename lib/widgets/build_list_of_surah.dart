import 'package:flutter/material.dart';

import '../models/quran_model/quran_model.dart';
import '../ui/display_image/display_image.dart';

class BuildListOfSurah extends StatelessWidget {
  const BuildListOfSurah({super.key, required this.surah});

  final Surahs surah; // Change to Surahs

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=> DisplayImage(surahNumber: surah.number!,
                surahs: surah,)));
        },
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(
                    surah.number.toString(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      surah.englishName!, // Display the Surah name
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      surah.revelationType!, // Display the English name
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                Text(surah.name!,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}