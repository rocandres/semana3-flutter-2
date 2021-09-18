import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semana3noticias/Models/articles.model.dart';
import 'package:semana3noticias/Providers/articulo.provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ArticleProvider articleProvider=ArticleProvider();
  Future<List<Article>>? listaArticles;
  int temporal=1;

  @override
  void initState() {
    listaArticles=articleProvider.getArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),        
      ),
      body: _body(),
    );
  }

  _body() {
    
    return FutureBuilder(
      future: listaArticles,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          List<Text> lista=[];
          
          snapshot.data.forEach((item)=>
            lista.add(Text(item.author))
          );
          return ListView(
            children: lista,
          );
        }else{
          return Text("no hay data");
        }
        
      }
    );

  }
}