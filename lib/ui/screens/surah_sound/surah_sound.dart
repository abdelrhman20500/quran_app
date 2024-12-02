import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran_app/Api/api_service.dart';
import 'package:quran_app/models/surah_audio_model/surah_audio_model.dart';

class SurahSound extends StatefulWidget {
  const SurahSound({super.key, required this.surahNum});

  final int surahNum;

  @override
  _SurahSoundState createState() => _SurahSoundState();
}

class _SurahSoundState extends State<SurahSound> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int currentSurahIndex = 0;
  int currentAyahIndex = 0;
  SurahAudioModel? surahAudioModel;
  String completeText = '';

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerComplete.listen((event) {
      if (currentAyahIndex < surahAudioModel!.data!.surahs![currentSurahIndex].ayahs!.length - 1) {
        setState(() {
          currentAyahIndex++;
          _playAudio();
        });
      }
    });
    _fetchSurahAudio();
  }

  Future<void> _fetchSurahAudio() async {
    SurahAudioModel fetchedAudio = await ApiService.getSurahAudio();
    setState(() {
      surahAudioModel = fetchedAudio;
      currentSurahIndex = surahAudioModel!.data!.surahs!.indexWhere((surah) => surah.number == widget.surahNum);
      completeText = _generateCompleteText();
    });
  }

  String _generateCompleteText() {
    String text = '';
    for (var ayah in surahAudioModel!.data!.surahs![currentSurahIndex].ayahs!) {
      text += ayah.text! + ' ';
    }
    return text;
  }

  Future<void> _playAudio() async {
    await _audioPlayer.play(UrlSource(surahAudioModel!.data!.surahs![currentSurahIndex].ayahs![currentAyahIndex].audio!));
    setState(() {
      isPlaying = true;
    });
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void _previousSurah() {
    if (currentSurahIndex > 0) {
      setState(() {
        currentSurahIndex--;
        currentAyahIndex = 0; // Reset to the first Ayah of the previous Surah
        completeText = _generateCompleteText(); // Update complete text
        _playAudio();
      });
    }
  }

  void _nextSurah() {
    if (currentSurahIndex < surahAudioModel!.data!.surahs!.length - 1) {
      setState(() {
        currentSurahIndex++;
        currentAyahIndex = 0; // Reset to the first Ayah of the next Surah
        completeText = _generateCompleteText(); // Update complete text
        _playAudio();
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: surahAudioModel == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: const Color(0xff14213D),
                  borderRadius: BorderRadius.circular(22)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    surahAudioModel!.data!.surahs![currentSurahIndex].name!,
                    style: const TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text("Total Ayah: ${surahAudioModel!.data!.surahs![currentSurahIndex].ayahs!.length}",
                      style: const TextStyle(color: Colors.white ,fontSize: 22, fontWeight: FontWeight.w600)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: _previousSurah,
                          icon: const Icon(Icons.skip_previous,color: Colors.white , size: 52)),
                      IconButton(
                          onPressed: () async {
                            if (isPlaying) {
                              await _pauseAudio();
                            } else {
                              await _playAudio();
                            }
                          },
                          icon: Icon(
                            isPlaying ? Icons.pause_circle : Icons.play_circle,
                            size: 52,color: Colors.white ,
                          )),
                      IconButton(
                          onPressed: _nextSurah,
                          icon: const Icon(Icons.skip_next,color: Colors.white , size: 52)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
