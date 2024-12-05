import 'package:flutter/material.dart';
import 'package:quran_app/models/all_surah_model/all_surah_model.dart';
import '../../ui/screens/text_quran_page/text_quran_page.dart';


class BuildAllSurah extends StatelessWidget {
  const BuildAllSurah({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=> TextQuranPage(
                surahNumber: data.number!,
              )));
          // print(data.number);
        },
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color(0xff14213D),
                  child: Text(
                    data.number!.toString(),
                    style: const TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      data.englishName!, // Display the Surah name
                      style: const TextStyle(color: Color(0xff14213D),
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.revelationType!, // Display the English name
                      style: const TextStyle(color: Color(0xff14213D),fontSize: 19),
                    ),
                  ],
                ),
                const Spacer(),
                Text(data.name!,
                  style: const TextStyle(color: Color(0xff14213D),
                      fontSize: 22, fontWeight: FontWeight.w600),
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