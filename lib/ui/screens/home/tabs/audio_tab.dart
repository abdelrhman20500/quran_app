import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../cubits/cubits/all_surah_cubit.dart';
import '../../../../cubits/states/all_surah_state.dart';
import '../../../../widgets/audio/all_surah_audio.dart';

class AudioTab extends StatelessWidget {
  const AudioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AllSurahCubit()..getAllSurah(),
        child: BlocConsumer<AllSurahCubit, AllSurahState>(
          listener: (BuildContext context, AllSurahState state) {
            if (state is ErrorAllSurah) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
            }
          },
          builder: (BuildContext context, AllSurahState state) {
            if (state is LoadingAllSurah) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: const Color(0xff14213D),
                  size: 120,
                ),
              );
            } else if (state is SuccessAllSurah) {
              return ListView.builder(
                itemCount: state.allSurahModel.data!.length,
                itemBuilder: (context, index) {
                  return AllSurahAudio(data: state.allSurahModel.data![index]);
                },
              );
            } else if (state is ErrorAllSurah) {
              return const Center(child: Text("Error loading Surah data."));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
