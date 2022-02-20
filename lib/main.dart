import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //create an empty list
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    "1+1=2",
    "acomebeforeb",
    "youarehandsome",
    "bmiisbameeink",
    "12+25=35",
  ];
  List<bool> answers = [true, true, false, false, false];

  int questionNumber = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Score : ${score}\n${questions[questionNumber]}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  bool correctAnswer = answers[questionNumber];
                  if (correctAnswer == true) {
                    setState(() {
                      //เมื่อกดปุ่ม True เพิ่มข้อมูลเข้าไปในลิสต์ scoreKeeper โดยใช้ add method
                      scoreKeeper.add(const Icon(
                        Icons.check,
                        color: Colors.red,
                      ));
                    });
                    score++;
                  } else {
                    setState(() {
                      scoreKeeper.add(const Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    });
                  }
                  if (questionNumber < questions.length - 1) {
                    questionNumber++;
                  } else {
                    questionNumber = 0;
                    score = 0;
                    scoreKeeper.clear();
                  }
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              // color: Colors.red,
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = answers[questionNumber];
                if (correctAnswer == false) {
                  setState(() {
                    //เมื่อกดปุ่ม True เพิ่มข้อมูลเข้าไปในลิสต์ scoreKeeper โดยใช้ add method
                    scoreKeeper.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                  score++;
                } else {
                  setState(() {
                    scoreKeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                if (questionNumber < questions.length - 1) {
                  questionNumber++;
                } else {
                  questionNumber = 0;
                  score = 0;
                  scoreKeeper.clear();
                }
              },
            ),
          ),
        ),
        //แสดงผล icon สำหรับ scoreKeeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
