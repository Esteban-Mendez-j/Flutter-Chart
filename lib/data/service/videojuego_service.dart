import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:graficos/data/model/videojuego.dart';

class VideojuegoService {
  Future<List<VideoJuego>> getVideojuegos() async {
    try {
      final response = await rootBundle.loadString(
        "lib/assets/json/videojuegos.json",
      );

      final List<dynamic> jsonData = jsonDecode(response);

      return jsonData.map((json) => VideoJuego.fromJson(json)).toList();
    } catch (e) {
      log("Error al obtener los videojuegos: $e");
      throw Exception(e.toString());
    }
  }
}
