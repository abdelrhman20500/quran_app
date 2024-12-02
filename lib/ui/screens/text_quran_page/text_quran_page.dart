import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessSurahPage) {
              return SurahText(quranPageModel: state.quranPageModel);
            } else {
              return const Center(child: Text("Error loading Surah page."));
            }
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
    /// جمع النصوص معا: قمنا باستخدام map و join لجمع نصوص الآيات معًا في سطر واحد.

    /// عرض النص المجمع: قمنا بعرض النص المجمع في أداة Text مع تحديد textAlign إلى TextAlign.center لضمان توسيطه.
    // جمع النصوص معا في سطر واحد

    String completeText = quranPageModel.data!.ayahs!
        .map((ayah) => '${ayah.text!.trim()} (${ayah.numberInSurah})')
        .join(' ');

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
                icon: const Icon(Icons.arrow_back, color: Color(0xff14213D),),
                padding: EdgeInsets.zero, // Remove default padding of IconButton
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
          style: const TextStyle(color: Color(0xff14213D),
              fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
