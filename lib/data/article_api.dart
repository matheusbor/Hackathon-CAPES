import 'dart:convert';

import 'package:capes/model/article.dart';
import 'package:http/http.dart' as http;

class ArticleApi {
  Future<List<Artigo>> getArticles(String message) async {
    Map<String, String> queryParams = {
      'query': message,
    };

    final uri = Uri.http('192.168.0.135:5000', 'consultar', queryParams);

    http.Response response = await http.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    // Convertendo o corpo da resposta para JSON
    final List<dynamic> jsonData = json.decode(response.body);

    final List<Artigo> artigos = jsonData.map((item) => Artigo.fromJson(item)).toList();

    return artigos;
  }
}
