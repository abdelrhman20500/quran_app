import 'package:flutter/material.dart';

import '../../models/juz_model/get_juz.dart';
import '../../ui/screens/text_quran_page/text_quran_page.dart';

class JuzSurahs extends StatelessWidget {
  const JuzSurahs({super.key, required this.ayahs});
  final Ayahs ayahs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TextQuranPage(surahNumber: ayahs.surah!.number!),
            ),
          );
        },
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: const Color(0xff14213D),
                  child: Text(
                    ayahs.surah!.number!.toString(),
                    style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ayahs.surah!.englishName!,
                      style: const TextStyle(color: Color(0xff14213D), fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ayahs.surah!.revelationType!,
                      style: const TextStyle(color: Color(0xff14213D), fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  ayahs.surah!.name!,
                  style: const TextStyle(color: Color(0xff14213D), fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Divider(
              color: Color(0xff14213D),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
