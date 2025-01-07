import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:quran_app/models/juz_model/get_juz.dart';
import '../states/juz_state.dart';

class JuzCubit extends Cubit<JuzState> {
  JuzCubit() : super(InitialJuzState());

  Future<void> getJuz(int juzNum) async {
    emit(LoadingJuzState());
    try {
      Uri uri = Uri.parse("http://api.alquran.cloud/v1/juz/$juzNum");
      Response response = await get(uri);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        JuzModel juzModel = JuzModel.fromJson(jsonData);
        emit(SuccessJuzState(juzModel: juzModel));
      } else {
        emit(ErrorJuzState(errMessage: "Empty response body"));
      }
    } catch (e) {
      emit(ErrorJuzState(errMessage: e.toString()));
    }
  }
}
