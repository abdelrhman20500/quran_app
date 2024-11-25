
class SajdaModel {
  int? code;
  String? status;
  Data? data;

  SajdaModel({this.code, this.status, this.data});

  SajdaModel.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    status = json["status"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  List<Ayahs>? ayahs;
  Edition? edition;

  Data({this.ayahs, this.edition});

  Data.fromJson(Map<String, dynamic> json) {
    ayahs = json["ayahs"] == null ? null : (json["ayahs"] as List).map((e) => Ayahs.fromJson(e)).toList();
    edition = json["edition"] == null ? null : Edition.fromJson(json["edition"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(ayahs != null) {
      data["ayahs"] = ayahs?.map((e) => e.toJson()).toList();
    }
    if(edition != null) {
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
  String? direction;

  Edition({this.identifier, this.language, this.name, this.englishName, this.format, this.type, this.direction});

  Edition.fromJson(Map<String, dynamic> json) {
    identifier = json["identifier"];
    language = json["language"];
    name = json["name"];
    englishName = json["englishName"];
    format = json["format"];
    type = json["type"];
    direction = json["direction"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["identifier"] = identifier;
    data["language"] = language;
    data["name"] = name;
    data["englishName"] = englishName;
    data["format"] = format;
    data["type"] = type;
    data["direction"] = direction;
    return data;
  }
}

class Ayahs {
  int? number;
  String? text;
  Surah? surah;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  Sajda? sajda;

  Ayahs({this.number, this.text, this.surah, this.numberInSurah, this.juz, this.manzil, this.page, this.ruku, this.hizbQuarter, this.sajda});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    text = json["text"];
    surah = json["surah"] == null ? null : Surah.fromJson(json["surah"]);
    numberInSurah = json["numberInSurah"];
    juz = json["juz"];
    manzil = json["manzil"];
    page = json["page"];
    ruku = json["ruku"];
    hizbQuarter = json["hizbQuarter"];
    sajda = json["sajda"] == null ? null : Sajda.fromJson(json["sajda"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["number"] = number;
    data["text"] = text;
    if(surah != null) {
      data["surah"] = surah?.toJson();
    }
    data["numberInSurah"] = numberInSurah;
    data["juz"] = juz;
    data["manzil"] = manzil;
    data["page"] = page;
    data["ruku"] = ruku;
    data["hizbQuarter"] = hizbQuarter;
    if(sajda != null) {
      data["sajda"] = sajda?.toJson();
    }
    return data;
  }
}

class Sajda {
  int? id;
  bool? recommended;
  bool? obligatory;

  Sajda({this.id, this.recommended, this.obligatory});

  Sajda.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    recommended = json["recommended"];
    obligatory = json["obligatory"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["recommended"] = recommended;
    data["obligatory"] = obligatory;
    return data;
  }
}

class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;

  Surah({this.number, this.name, this.englishName, this.englishNameTranslation, this.revelationType, this.numberOfAyahs});

  Surah.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    name = json["name"];
    englishName = json["englishName"];
    englishNameTranslation = json["englishNameTranslation"];
    revelationType = json["revelationType"];
    numberOfAyahs = json["numberOfAyahs"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["number"] = number;
    data["name"] = name;
    data["englishName"] = englishName;
    data["englishNameTranslation"] = englishNameTranslation;
    data["revelationType"] = revelationType;
    data["numberOfAyahs"] = numberOfAyahs;
    return data;
  }
}