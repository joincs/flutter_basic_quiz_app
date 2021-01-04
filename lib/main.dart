import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 9},
        {'text': 'white', 'score': 7},
      ]
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Snake', 'score': 2},
        {'text': 'Girrafe', 'score': 4},
        {'text': 'Elephant', 'score': 8},
      ]
    },
    {
      'questionText': 'What is your favourite Programming Language?',
      'answers': [
        {'text': 'Python', 'score': 8},
        {'text': 'Flutter', 'score': 5},
        {'text': 'Php', 'score': 7},
        {'text': 'Javascript', 'score': 10},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _questionAnswer(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionAnswer: _questionAnswer,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
