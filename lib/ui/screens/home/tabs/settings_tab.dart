import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow,);
  }
}
// class AudioTab extends StatelessWidget {
//   const AudioTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<SurahAudioModel>(
//       future: ApiService.getSurahAudio(),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text(snapshot.error.toString()));
//         } else if (snapshot.hasData) {
//           final audio = snapshot.data;
//           return NewWidget(surahAudioModel: audio!);
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
//
// class NewWidget extends StatefulWidget {
//   const NewWidget({super.key, required this.surahAudioModel});
//   final SurahAudioModel surahAudioModel;
//
//   @override
//   _NewWidgetState createState() => _NewWidgetState();
// }
//
// class _NewWidgetState extends State<NewWidget> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//   int currentSurahIndex = 0;
//   int currentAyahIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer.onPlayerComplete.listen((event) {
//       if (currentAyahIndex < widget.surahAudioModel.data!.surahs![currentSurahIndex].ayahs!.length - 1) {
//         setState(() {
//           currentAyahIndex++;
//           _playAudio();
//         });
//       }
//     });
//   }
//
//   Future<void> _playAudio() async {
//     await _audioPlayer.play(UrlSource(widget.surahAudioModel.data!.surahs![currentSurahIndex].ayahs![currentAyahIndex].audio!));
//     setState(() {
//       isPlaying = true;
//     });
//   }
//
//   Future<void> _pauseAudio() async {
//     await _audioPlayer.pause();
//     setState(() {
//       isPlaying = false;
//     });
//   }
//
//   void _previousSurah() {
//     if (currentSurahIndex > 0) {
//       setState(() {
//         currentSurahIndex--;
//         currentAyahIndex = 0; // Reset to the first Ayah of the previous Surah
//         _playAudio();
//       });
//     }
//   }
//
//   void _nextSurah() {
//     if (currentSurahIndex < widget.surahAudioModel.data!.surahs!.length - 1) {
//       setState(() {
//         currentSurahIndex++;
//         currentAyahIndex = 0; // Reset to the first Ayah of the next Surah
//         _playAudio();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           widget.surahAudioModel.data!.surahs![currentSurahIndex].name!,
//           style: const TextStyle(fontSize: 32),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               onPressed: _previousSurah,
//               icon: const Icon(Icons.skip_previous, size: 52),
//             ),
//             IconButton(
//               onPressed: () async {
//                 if (isPlaying) {
//                   await _pauseAudio();
//                 } else {
//                   await _playAudio();
//                 }
//               },
//               icon: Icon(
//                 isPlaying ? Icons.pause_circle : Icons.play_circle,
//                 size: 52,
//               ),
//             ),
//             IconButton(
//               onPressed: _nextSurah,
//               icon: const Icon(Icons.skip_next, size: 52),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.volume_up, size: 52),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 "1.0 x",
//                 style: TextStyle(fontSize: 22),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }
// }
