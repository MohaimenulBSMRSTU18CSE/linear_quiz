import 'package:flutter/material.dart';
import 'package:linear_quiz/dynamiclist/questionsList.dart';

class EndQuiz extends StatelessWidget {
  final int totallanswer;
  final VoidCallback resetIndex;
  EndQuiz({required this.totallanswer, required this.resetIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
            Text(
              "Totall Currect Answer : ${totallanswer} ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: gusteranswer,
            ),
          ]),
          SizedBox(
            height: 14,
          ),
          Text(
            "quiz end and Again try to click Reset Button",
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(maximumSize: Size(200, 300)),
              onPressed: resetIndex,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restart_alt,
                    size: 25,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Reset",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
