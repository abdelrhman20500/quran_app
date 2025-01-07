import 'package:flutter/material.dart';
import 'package:quran_app/widgets/all_juz/build_list_of_juz.dart';
import 'package:quran_app/widgets/all_surah/list_of_surah.dart';
import '../../../../widgets/all_sujda/display_list_sujda.dart';
import '../../../../widgets/tab_bar_item/tab_bar_tem.dart';

class HomeTab extends StatelessWidget {
   const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            padding: EdgeInsets.all(18),
            tabs: [
              TabBarIItem(text: "Surah"),
              TabBarIItem(text: "Sajda"),
              TabBarIItem(text: "Juz"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
               ListOfSurah(),
                DisplayListSajda(),
                BuildListJuz(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




