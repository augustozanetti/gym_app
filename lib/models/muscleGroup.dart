import 'dart:convert';

class ResultMuscleGroup {
  String id;
  String name;
  String level;

  ResultMuscleGroup({
    this.id,
    this.name,
    this.level,
  });

  factory ResultMuscleGroup.fromJson(String str) =>
      ResultMuscleGroup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultMuscleGroup.fromMap(Map<String, dynamic> json) =>
      ResultMuscleGroup(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        level: json["level"] == null ? null : json["level"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "level": level == null ? null : level,
      };
}
