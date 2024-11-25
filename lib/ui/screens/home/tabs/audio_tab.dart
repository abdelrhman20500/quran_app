import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/cubits/all_surah_cubit.dart';
import 'package:quran_app/bloc/states/all_surah_state.dart';
import 'package:quran_app/ui/surah_sound/surah_sound.dart';
import '../../../../models/all_surah_model/all_surah_model.dart';

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
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessAllSurah) {
              return Column(
                children: [
                  const Image(
                    image: AssetImage("assets/images/quran_audio_logo.png"),
                    fit: BoxFit.cover,
                    height: 140,
                    width: 140,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.allSurahModel.data!.length,
                      itemBuilder: (context, index) {
                        return AllSurahAudio(data: state.allSurahModel.data![index]);
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text("Error loading Surah data."));
            }
          },
        ),
      ),
    );
  }
}

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
                  backgroundColor: Colors.black,
                  child: Text(
                    data.number!.toString(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.englishName!,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.revelationType!,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  data.name!,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
