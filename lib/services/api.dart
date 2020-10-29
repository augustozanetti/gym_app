import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/muscleGroup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final api = "http://9e3b72426154.ngrok.io/";

class ApiService {
  static Future<List<ResultMuscle>> fetchMuscle() async {
    final response = await http.get("${api}muscle");

    if (response.statusCode == 200) {
      List<ResultMuscle> muscles;
      muscles = (json.decode(response.body) as List)
          .map((i) => ResultMuscle.fromMap(i))
          .toList();

      return muscles;
    } else {
      throw Exception('Requisição inválida!');
    }
  }

  static Future<List<ResultMuscleGroup>> fetchMuscleGroup(String id) async {
    final response = await http.get("${api}muscle-group/${id}");

    if (response.statusCode == 200) {
      List<ResultMuscleGroup> muscles;
      muscles = (json.decode(response.body) as List)
          .map((i) => ResultMuscleGroup.fromMap(i))
          .toList();

      return muscles;
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
