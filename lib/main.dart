import 'package:flutter/material.dart';
import 'package:spacex/pagina_principal.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Space X',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home:  new PaginaPrincipal(),
    );
  }
}
