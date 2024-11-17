import 'package:flutter/material.dart';
import 'package:quran_app/Api/api_service.dart';
import 'package:quran_app/models/quran_model/quran_model.dart';
import '../../../../widgets/build_list_of_surah.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            padding: EdgeInsets.all(18),
            tabs: [
              Tab(text: "Surah"),
              Tab(text: "Sajda"),
              Tab(text: "Juz"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                FutureBuilder<QuranModel>(
                  future: ApiService.getQuran(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      // Use the data received from the Future
                      final quranModel = snapshot.data!;
                      return ListView.builder(
                        itemCount: quranModel.data?.surahs?.length,
                        itemBuilder: (context, index) {
                          // Pass the specific Surah to the BuildListOfSurah widget
                          return BuildListOfSurah(surah: quranModel.data!.surahs![index]);
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                const Center(child: Text("222")),
                GridView.builder(
                  itemCount: 30, // Use the length of the decoded data
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    return BuildListOfJuz();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildListOfJuz extends StatelessWidget {
  const BuildListOfJuz({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      height: 60,
      width: 60,
      child: const Center(
        child: Text("1", style: TextStyle(fontSize: 32)),
      ),
    );
  }
}

