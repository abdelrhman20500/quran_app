import 'package:quran_app/models/all_surah_model/all_surah_model.dart';

abstract class AllSurahState {}

class InitialAllSurah extends AllSurahState {}

class LoadingAllSurah extends AllSurahState {}

class SuccessAllSurah extends AllSurahState {
  final AllSurahModel allSurahModel;

  SuccessAllSurah({required this.allSurahModel});
}

class ErrorAllSurah extends AllSurahState {
  final String errMessage;

  ErrorAllSurah({required this.errMessage});
}