import 'package:quran_app/models/sajda_model/sajda_model.dart';

abstract class SajdaState {}

class InitialSajdaState extends SajdaState {}

class LoadingSajdaState extends SajdaState {}

class SuccessSajdaState extends SajdaState {
  final SajdaModel sajdaModel;

  SuccessSajdaState({required this.sajdaModel});
}

class ErrorSajdaState extends SajdaState {
  final String errMessage;

  ErrorSajdaState({required this.errMessage});
}