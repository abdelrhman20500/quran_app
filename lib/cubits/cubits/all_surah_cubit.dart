import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../models/all_surah_model/all_surah_model.dart';
import '../states/all_surah_state.dart';

class AllSurahCubit extends Cubit<AllSurahState> {
  AllSurahCubit() : super(InitialAllSurah());

  Future<void> getAllSurah() async {
    emit(LoadingAllSurah());
    try {
      Uri uri = Uri.parse("http://api.alquran.cloud/v1/surah");
      Response response = await get(uri);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        AllSurahModel allSurahModel = AllSurahModel.fromJson(jsonData);
        emit(SuccessAllSurah(allSurahModel: allSurahModel));
      } else {
        emit(ErrorAllSurah(errMessage: "Empty response body"));
      }
    } catch (e) {
      emit(ErrorAllSurah(errMessage: e.toString()));
    }
  }
}
