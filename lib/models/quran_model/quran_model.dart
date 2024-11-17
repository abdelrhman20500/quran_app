import 'dart:convert';

class QuranModel {
  int? code;
  String? status;
  Data? data;

  QuranModel({this.code, this.status, this.data});

  QuranModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    status = json["status"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["status"] = status;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  List<Surahs>? surahs;
  Edition? edition;

  Data({this.surahs, this.edition});

  Data.fromJson(Map<String, dynamic> json) {
    surahs = json["surahs"] == null
        ? null
        : (json["surahs"] as List).map((e) => Surahs.fromJson(e)).toList();
    edition =
    json["edition"] == null ? null : Edition.fromJson(json["edition"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (surahs != null) {
      data["surahs"] = surahs?.map((e) => e.toJson()).toList();
    }
    if (edition != null) {
      data["edition"] = edition?.toJson();
    }
    return data;
  }
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;

  Edition(
      {this.identifier,
        this.language,
        this.name,
        this.englishName,
        this.format,
        this.type});

  Edition.fromJson(Map<String, dynamic> json) {
    identifier = json["identifier"];
    language = json["language"];
    name = json["name"];
    englishName = json["englishName"];
    format = json["format"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["identifier"] = identifier;
    data["language"] = language;
    data["name"] = name;
    data["englishName"] = englishName;
    data["format"] = format;
    data["type"] = type;
    return data;
  }
}

class Surahs {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<Ayahs>? ayahs;

  Surahs(
      {this.number,
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.revelationType,
        this.ayahs});

  Surahs.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    name = json["name"];
    englishName = json["englishName"];
    englishNameTranslation = json["englishNameTranslation"];
    revelationType = json["revelationType"];
    ayahs = json["ayahs"] == null
        ? null
        : (json["ayahs"] as List).map((e) => Ayahs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["number"] = number;
    data["name"] = name;
    data["englishName"] = englishName;
    data["englishNameTranslation"] = englishNameTranslation;
    data["revelationType"] = revelationType;
    if (ayahs != null) {
      data["ayahs"] = ayahs?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Ayahs {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayahs(
      {this.number,
        this.text,
        this.numberInSurah,
        this.juz,
        this.manzil,
        this.page,
        this.ruku,
        this.hizbQuarter,
        this.sajda});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    text = json["text"];
    numberInSurah = json["numberInSurah"];
    juz = json["juz"];
    manzil = json["manzil"];
    page = json["page"];
    ruku = json["ruku"];
    hizbQuarter = json["hizbQuarter"];
    sajda = json["sajda"] is bool ? json["sajda"] : false; // Handle non-bool
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["number"] = number;
    data["text"] = text;
    data["numberInSurah"] = numberInSurah;
    data["juz"] = juz;
    data["manzil"] = manzil;
    data["page"] = page;
    data["ruku"] = ruku;
    data["hizbQuarter"] = hizbQuarter;
    data["sajda"] = sajda;
    return data;
  }
}