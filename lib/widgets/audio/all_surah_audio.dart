import 'package:flutter/material.dart';

import '../../models/all_surah_model/all_surah_model.dart';
import '../../ui/screens/surah_sound/surah_sound.dart';

class AllSurahAudio extends StatelessWidget {
  const AllSurahAudio({super.key, required this.data});

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SurahSound(surahNum: data.number!)),
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
                    data.number!.toString(),
                    style: const TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.englishName!,
                      style: const TextStyle(color: Color(0xff14213D),fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.revelationType!,
                      style: const TextStyle(color:Color(0xff14213D),fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  data.name!,
                  style: const TextStyle(color:Color(0xff14213D),fontSize: 22, fontWeight: FontWeight.w600),
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
