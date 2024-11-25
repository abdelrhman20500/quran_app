import 'package:quran_app/models/quran_page/quran_page_model.dart';

abstract class SurahPageState {}

class InitialSurahPage extends SurahPageState {}

class LoadingSurahPage extends SurahPageState {}

class SuccessSurahPage extends SurahPageState {
  final QuranPageModel quranPageModel;

  SuccessSurahPage({required this.quranPageModel});
}

class ErrorSurahPage extends SurahPageState {
  final String errMessage;

  ErrorSurahPage({required this.errMessage});
}