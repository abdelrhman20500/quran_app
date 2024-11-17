import 'dart:convert';

import 'package:http/http.dart';
import 'package:quran_app/models/quran_model/quran_model.dart';

class ApiService{
  static Future<QuranModel> getQuran()async{
    Uri uri= Uri.parse("http://api.alquran.cloud/v1/quran");
    Response response = await get(uri);
    if (response.statusCode >= 200 && response.statusCode < 300){
      Map<String, dynamic> jsonDate = jsonDecode(response.body);
      print(jsonDate);
      QuranModel quranModel = QuranModel.fromJson(jsonDate);
      return quranModel;
    }else {
      // Handle case where response body is empty
      throw Exception("Empty response body");
    }
  }
}