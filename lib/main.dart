import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "QuestionData.dart";
// ignore: implementation_imports
import 'package:flutter/src/material/theme.dart';
import 'Questions.dart';

void main() {
  runApp(MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Theme(
        // Create a unique theme with `ThemeData`
        data: ThemeData(
          splashColor: Colors.yellow,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Center(
                child: Text(
              'Quizzler',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
            backgroundColor: Colors.blue,
          ),
          body: SafeArea(
            child: MyQuiz(),
          ),
        ),
      ),
    );
  }
}

class MyQuiz extends StatefulWidget {
  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  // Custom Falt Button
  CustomButton(bool num, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FlatButton(
        shape: StadiumBorder(),
        color: color,
        onPressed: () {
          compareAnswer(num);
        },
        child: Text(
          '$text',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  //make clas objects with class data type
  QuizBrain obj = QuizBrain();
  List<Widget> scorkeeper = [];

  void compareAnswer(bool answer) {
    bool corretAnswer = obj.CorrectAnswer();
    if (obj.isFinished() == true) {
      obj.reset();
      scorkeeper = [];
    } else {
      if (corretAnswer == answer) {
        scorkeeper.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        scorkeeper.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      setState(() {
        obj.nextQuestions();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 400,
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(
                obj.GetQuestions(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          CustomButton(true, "True", Colors.green),
          CustomButton(false, "False", Colors.red),
          SizedBox(
            height: 10,
          ),
          Row(
            children: scorkeeper,
          )
        ],
      ),
    );
  }
}
