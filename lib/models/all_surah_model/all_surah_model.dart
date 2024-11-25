
class AllSurahModel {
  int? code;
  String? status;
  List<Data>? data;

  AllSurahModel({this.code, this.status, this.data});

  AllSurahModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    status = json["status"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  Data({this.number, this.name, this.englishName, this.englishNameTranslation, this.numberOfAyahs, this.revelationType});

  Data.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    name = json["name"];
    englishName = json["englishName"];
    englishNameTranslation = json["englishNameTranslation"];
    numberOfAyahs = json["numberOfAyahs"];
    revelationType = json["revelationType"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["number"] = number;
    data["name"] = name;
    data["englishName"] = englishName;
    data["englishNameTranslation"] = englishNameTranslation;
    data["numberOfAyahs"] = numberOfAyahs;
    data["revelationType"] = revelationType;
    return data;
  }
}