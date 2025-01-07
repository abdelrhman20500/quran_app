import 'package:quran_app/models/juz_model/get_juz.dart';

abstract class JuzState {}

class InitialJuzState extends JuzState {}

class LoadingJuzState extends JuzState {}

class SuccessJuzState extends JuzState {
  final JuzModel juzModel;

  SuccessJuzState({required this.juzModel});
}

class ErrorJuzState extends JuzState {
  final String errMessage;

  ErrorJuzState({required this.errMessage});
}