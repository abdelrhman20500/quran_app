import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/cubits/juz_cubit.dart';
import 'package:quran_app/bloc/states/juz_state.dart';
import 'package:quran_app/models/juz_model/get_juz.dart';

import '../../ui/screens/text_quran_page/text_quran_page.dart';

class GetSurahOfJuz extends StatelessWidget {
  const GetSurahOfJuz({super.key, required this.numberOfJuz});

  final int numberOfJuz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the CircleAvatar
              shape: BoxShape.circle, // Make the container circular
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 1, // Spread radius of the shadow
                  blurRadius: 5, // Blur radius of the shadow
                  offset: const Offset(0, 7), // Offset of the shadow (x, y)
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                padding: EdgeInsets.zero, // Remove default padding of IconButton
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text('Surahs in Juz',style: TextStyle(color: Colors.white,
        fontSize: 24, fontWeight: FontWeight.w600),),
      ),
      body: BlocProvider(
        create: (context) => JuzCubit()..getJuz(numberOfJuz),
        child: BlocConsumer<JuzCubit, JuzState>(
          listener: (context, state) {
            if (state is ErrorJuzState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingJuzState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessJuzState) {
              return buildListView(state.juzModel.data!.ayahs!);
            } else {
              return const Center(child: Text("Error loading Juz data."));
            }
          },
        ),
      ),
    );
  }

  ListView buildListView(List<Ayahs> ayahsList) {
    // Use a Set to keep track of unique Surah names
    Set<String> uniqueSurahs = {};

    // Filtered List to hold unique Ayahs based on Surah name
    List<Ayahs> filteredAyahs = [];

    for (var ayah in ayahsList) {
      String surahName = ayah.surah!.name!;
      // If the Surah name is not already in the set, add it to the filtered list
      if (!uniqueSurahs.contains(surahName)) {
        uniqueSurahs.add(surahName);
        filteredAyahs.add(ayah);
      }
    }

    return ListView.builder(
      itemCount: filteredAyahs.length,
      itemBuilder: (BuildContext context, int index) {
        return NewWidget(
          ayahs: filteredAyahs[index],
        );
      },
    );
  }
}


class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.ayahs,});
  final Ayahs ayahs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
         Navigator.push(context, MaterialPageRoute(
             builder: (context)=>TextQuranPage(surahNumber: ayahs.surah!.number!)));
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
                    style: const TextStyle(fontSize: 22,
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ayahs.surah!.englishName!,
                      style: const TextStyle(color: Color(0xff14213D),
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ayahs.surah!.revelationType!,
                      style: const TextStyle(color:Color(0xff14213D), fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  ayahs.surah!.name!,
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