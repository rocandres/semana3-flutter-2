import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/home.page.dart';

void main() {
  runApp(MiAplicacion());
  
}
class MiAplicacion extends StatelessWidget {
  const MiAplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Apliacion de noticias",
      theme: ThemeData.light(),
      home: HomePage(),

    );
  }
}