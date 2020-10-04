import 'dart:convert';

// List<ResultMuscle> modelMuscleFromJson(String str) => List<ResultMuscle>.from(
//     json.decode(str).map((x) => ResultMuscle.fromJson(x)));

// String modelUserToJson(List<ResultMuscle> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResultMuscle {
  String name;
  String pathImage;

  ResultMuscle({
    this.name,
    this.pathImage,
  });

  factory ResultMuscle.fromJson(String str) =>
      ResultMuscle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultMuscle.fromMap(Map<String, dynamic> json) => ResultMuscle(
        name: json["name"] == null ? null : json["name"],
        pathImage: json["pathImage"] == null ? null : json["pathImage"],
      );

  Map<String, dynamic> toMap() => {
        "member": name == null ? null : name,
        "pathImage": pathImage == null ? null : pathImage,
      };
}
