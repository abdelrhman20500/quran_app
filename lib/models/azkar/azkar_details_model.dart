
class AzkarDetailsModel {
  int? sectionId;
  String? count;
  String? description;
  String? reference;
  String? content;

  AzkarDetailsModel({this.sectionId, this.count, this.description, this.reference, this.content});

  AzkarDetailsModel.fromJson(Map<String, dynamic> json) {
    sectionId = json["section_id"];
    count = json["count"];
    description = json["description"];
    reference = json["reference"];
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["section_id"] = sectionId;
    data["count"] = count;
    data["description"] = description;
    data["reference"] = reference;
    data["content"] = content;
    return data;
  }
}