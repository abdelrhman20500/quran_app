import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/states/all_surah_state.dart';
import 'package:quran_app/bloc/cubits/all_surah_cubit.dart';
import 'build_all_surah.dart';

class DisplayListSurah extends StatelessWidget {
  const DisplayListSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AllSurahCubit()..getAllSurah(),
        child: BlocConsumer<AllSurahCubit, AllSurahState>(
          listener: (context, state) {
            if (state is ErrorAllSurah) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingAllSurah) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessAllSurah) {
              return ListView.builder(
                itemCount: state.allSurahModel.data!.length,
                itemBuilder: (context, index) {
                  return BuildAllSurah(data: state.allSurahModel.data![index]);
                },
              );
            } else {
              return const Center(child: Text("Error loading Surah audio."));
            }
          },
        ),
    );
  }
}
