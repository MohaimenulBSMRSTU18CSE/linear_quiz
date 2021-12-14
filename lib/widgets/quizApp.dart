import 'package:flutter/material.dart';
import '../widgets/endPage.dart';

import '../dynamiclist/questionsList.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> allQuestions = questions;
  List<bool> answer = answers;
  // final int lenghtQuestions = allQuestions.length;
  int _questionIndex = 0;
  int _totallAnswer = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totallAnswer = 0;
      gusteranswer.clear();
    });
  }

  Widget buildExpanded(
      {required String conditionsText,
      required Color bgColor,
      required bool truefalse}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: bgColor),
        child: Text(conditionsText,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        onPressed: _questionIndex < allQuestions.length
            ? () {
                final currectanswer = answer[_questionIndex];
                if (currectanswer == truefalse) {
                  gusteranswer.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 25,
                    ),
                  );
                  _totallAnswer++;
                } else {
                  gusteranswer.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 25,
                    ),
                  );
                }
                setState(() {
                  _questionIndex++;
                });
              }
            : () {},
      ),
    );
  }

  void indexIncrement(questionIndex) {
    setState(() {
      _questionIndex = questionIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: _questionIndex < allQuestions.length
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        allQuestions[_questionIndex],
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: gusteranswer,
                      )
                    ],
                  )
                : EndQuiz(
                    totallanswer: _totallAnswer,
                    resetIndex: resetQuiz,
                  ),
          ),
        ),

        // buildExpanded(conditionsText: 'True', bgColor: Colors.green.shade600),
        buildExpanded(
            conditionsText: 'True',
            bgColor: Colors.green.shade600,
            truefalse: true),
        SizedBox(
          height: 5,
        ),
        buildExpanded(
            conditionsText: 'False',
            bgColor: Colors.red.shade600,
            truefalse: false)
      ],
    );
  }
}
