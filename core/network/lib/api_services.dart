import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:network/model.dart';

class ApiServices {
  static Future<ResponsePokemonList?> getHome() async {
    try {
      final url = Uri.parse('https://pokeapi.co/api/v2/pokemon');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = responsePokemonListFromJson(response.body);
        return data;
      } else {
        throw Exception("Status Code: ${response.statusCode}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("ERROR $e");
      }
      return null;
    }
  }
}
