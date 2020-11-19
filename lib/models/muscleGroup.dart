import 'dart:convert';

class ResultMuscleGroup {
  String id;
  String name;
  String level;
  String videoPath;

  ResultMuscleGroup({this.id, this.name, this.level, this.videoPath});

  factory ResultMuscleGroup.fromJson(String str) =>
      ResultMuscleGroup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultMuscleGroup.fromMap(Map<String, dynamic> json) =>
      ResultMuscleGroup(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        level: json["level"] == null ? null : json["level"],
        videoPath: json["videoPath"] == null ? null : json["videoPath"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "level": level == null ? null : level,
        "videoPath": videoPath == null ? null : videoPath,
      };
}
