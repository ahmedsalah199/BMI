import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          textTheme:  const TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          )),
      home: MyHomePage(),
    );
  }
}
