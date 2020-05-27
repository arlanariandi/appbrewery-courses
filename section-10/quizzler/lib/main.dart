import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    ));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  int quistionsNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain.questionBank[quistionsNumber].questionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      "True",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      bool corectAnswer = quizBrain
                          .questionBank[quistionsNumber].questionAnswer;

                      if (corectAnswer == true) {
                        print("user got it right!");
                      } else {
                        print("user got it wrong");
                      }

                      setState(() {
                        // scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                        quistionsNumber++;
                      });
                      print(quistionsNumber);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      bool corectAnswer = quizBrain
                          .questionBank[quistionsNumber].questionAnswer;

                      if (corectAnswer == false) {
                        print("user got it right!");
                      } else {
                        print("user got it wrong");
                      }
                      setState(() {
                        // scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                        quistionsNumber++;
                      });
                      print(quistionsNumber);
                    },
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}
