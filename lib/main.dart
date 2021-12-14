import 'package:flutter/material.dart';
import './widgets/quizApp.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linear Quiz'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: QuizApp(),
      ),
    );
  }
}
