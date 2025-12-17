import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kiemtragiuaky/model/article.dart';

class NewsService {
  final String apiKey = "db88742bcb5447a1abcd19cada110dbe";

  Future<List<Article>> fetchNews() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
    );

    final res = await http.get(url);

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body)["articles"];
      return data.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception("Không lấy được dữ liệu!");
    }
  }
}
