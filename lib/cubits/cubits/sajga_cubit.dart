import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:quran_app/models/sajda_model/sajda_model.dart';
import '../states/sajda_state.dart';

class SajdaCubit extends Cubit<SajdaState> {
  SajdaCubit() : super(InitialSajdaState());

  Future<void> getSajda() async {
    emit(LoadingSajdaState());
    try {
      Uri uri = Uri.parse("http://api.alquran.cloud/v1/sajda");
      Response response = await get(uri);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        SajdaModel sajdaModel = SajdaModel.fromJson(jsonData);
        emit(SuccessSajdaState(sajdaModel: sajdaModel));
      } else {
        emit(ErrorSajdaState(errMessage: "Empty response body"));
      }
    } catch (e) {
      emit(ErrorSajdaState(errMessage: e.toString()));
    }
  }
}
