import 'package:flutter/material.dart';
import 'package:quran_app/models/sajda_model/sajda_model.dart';
import 'package:quran_app/ui/text_quran_page/text_quran_page.dart';


class BuildListOfSajda extends StatelessWidget {
  const BuildListOfSajda({super.key, required this.ayahs});

  final Ayahs ayahs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=> TextQuranPage(
                surahNumber: ayahs.surah!.number!,
              )));
        },
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(
                   ayahs.surah!.number!.toString(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      ayahs.surah!.englishName!, // Display the Surah name
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ayahs.surah!.revelationType!, // Display the English name
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                Text(ayahs.surah!.name!,
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