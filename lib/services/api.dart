import 'package:gym_app/models/muscle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<List<ResultMuscle>> fetchMuscle() async {
    final api = "http://aac38798b8f0.ngrok.io/";
    final response = await http.get("${api}muscle/");
    print(response);
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
}
