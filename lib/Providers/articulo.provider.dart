import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:semana3noticias/Models/articles.model.dart';

class ArticleProvider{

  Future<List<Article>> getArticle() async {
    List<Article> listaArticle=[];

    Map<String,String> parametros={
      'q':'tesla',
      'from':'2021-09-17',
      'sortBy':'publishedAt',
      'apiKey':'3fbb144e76a84dcfb99b6e2f3236bcf8'

    };

    var url =
      Uri.https('newsapi.org', '/v2/everything', parametros);
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse["articles"].forEach((item)=>{
        listaArticle.add(Article.fromJson(item))
      });
      return listaArticle;
    } else {
      return [];
    }
  }
}