import 'dart:convert';
import 'package:http/http.dart';
import 'package:quran_app/models/surah_audio_model/surah_audio_model.dart';

class ApiService{
  static Future<SurahAudioModel> getSurahAudio()async{
    Uri uri= Uri.parse("http://api.alquran.cloud/v1/quran/ar.alafasy");
    Response response = await get(uri);
    if (response.statusCode >= 200 && response.statusCode < 300){
      Map<String, dynamic> jsonDate = jsonDecode(response.body);
      print("object");
      print(jsonDate);
      SurahAudioModel surahAudioModel = SurahAudioModel.fromJson(jsonDate);
      return surahAudioModel;
    }else {
      throw Exception("Empty response body");
    }
  }
}