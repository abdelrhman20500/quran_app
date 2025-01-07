import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:quran_app/models/quran_page/quran_page_model.dart';
import '../states/surah_page_state.dart';

class SurahPageCubit extends Cubit<SurahPageState> {
  SurahPageCubit() : super(InitialSurahPage());

  Future<void> getQuranPage(int surahNumber) async {
    emit(LoadingSurahPage());
    try {
      Uri uri = Uri.parse("http://api.alquran.cloud/v1/surah/$surahNumber");
      Response response = await get(uri);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        QuranPageModel quranPageModel = QuranPageModel.fromJson(jsonData);
        emit(SuccessSurahPage(quranPageModel: quranPageModel));
      } else {
        emit(ErrorSurahPage(errMessage: "Empty response body"));
      }
    } catch (e) {
      emit(ErrorSurahPage(errMessage: e.toString()));
    }
  }
}
