import 'package:calculator/MyComponents/myButton.dart';
import 'package:calculator/const.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  var tempAnswer = '';

  double equal(var userInput) {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double exp = expression.evaluate(EvaluationType.REAL, contextModel);
    return exp;
  }

  void check() {
    if (userInput.length == 0) return;
    var c = userInput[userInput.length - 1];
    if (c == '%' || c == '/' || c == '*' || c == '+' || c == '-' || c == '.') {
      userInput = userInput.substring(0, userInput.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        answer.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          buttontitle: 'AC',
                          onPressed: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '%',
                          onPressed: () {
                            check();
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: 'DEL',
                          onPressed: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '/',
                          buttonColor: myBottonOrange,
                          onPressed: () {
                            check();
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          buttontitle: '7',
                          onPressed: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '8',
                          onPressed: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '9',
                          onPressed: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: 'X',
                          buttonColor: myBottonOrange,
                          onPressed: () {
                            check();
                            userInput += '*';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          buttontitle: '4',
                          onPressed: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '5',
                          onPressed: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '6',
                          onPressed: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '-',
                          buttonColor: myBottonOrange,
                          onPressed: () {
                            check();
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          buttontitle: '1',
                          onPressed: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '2',
                          onPressed: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '3',
                          onPressed: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '+',
                          buttonColor: myBottonOrange,
                          onPressed: () {
                            check();
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          buttontitle: '00',
                          onPressed: () {
                            userInput += '00';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '0',
                          onPressed: () {
                            check();
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '.',
                          onPressed: () {
                            check();
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          buttontitle: '=',
                          buttonColor: myBottonOrange,
                          onPressed: () {
                            check();
                            answer = equal(userInput).toString();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
