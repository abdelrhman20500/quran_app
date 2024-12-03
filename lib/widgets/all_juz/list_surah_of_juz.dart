import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quran_app/bloc/cubits/juz_cubit.dart';
import 'package:quran_app/bloc/states/juz_state.dart';
import 'package:quran_app/models/juz_model/get_juz.dart';
import 'juz_surahs.dart';

class ListSurahOfJuz extends StatelessWidget {
  const ListSurahOfJuz({super.key, required this.numberOfJuz});

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
        title: const Text(
          'Surahs in Juz',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        ),
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
              return Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: const Color(0xff14213D),
                  size: 75,
                ),
              );
            } else if (state is SuccessJuzState) {
              return buildListView(state.juzModel.data!.ayahs!);
            } else if (state is ErrorJuzState) {
              return const Center(child: Text("Error loading Juz data."));
            }
            return const Center(child: CircularProgressIndicator());
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
        return JuzSurahs(
          ayahs: filteredAyahs[index],
        );
      },
    );
  }
}

