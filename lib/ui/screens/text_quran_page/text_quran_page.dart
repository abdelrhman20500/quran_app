import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quran_app/bloc/cubits/surah_page_cubit.dart';
import 'package:quran_app/bloc/states/surah_page_state.dart';
import 'package:quran_app/models/quran_page/quran_page_model.dart';

class TextQuranPage extends StatelessWidget {
  const TextQuranPage({super.key, required this.surahNumber});

  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahPageCubit()..getQuranPage(surahNumber),
      child: BlocConsumer<SurahPageCubit, SurahPageState>(
        listener: (context, state) {
          if (state is ErrorSurahPage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingSurahPage) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: const Color(0xff14213D),
                size: 75,
              ),
            );
          } else if (state is SuccessSurahPage) {
            return SurahText(quranPageModel: state.quranPageModel);
          } else if (state is ErrorSurahPage) {
            return const Center(child: Text("Error loading Surah page."));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class SurahText extends StatelessWidget {
  const SurahText({super.key, required this.quranPageModel});

  final QuranPageModel quranPageModel;

  @override
  Widget build(BuildContext context) {
    String completeText = quranPageModel.data!.ayahs!
        .map((ayah) => '${ayah.text!.trim()} (${ayah.numberInSurah})')
        .join(' ');

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 7),
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
                icon: const Icon(Icons.arrow_back, color: Color(0xff14213D)),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          quranPageModel.data!.name!,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          completeText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff14213D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
