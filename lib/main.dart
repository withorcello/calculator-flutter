import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

typedef OperadorFunc = double Function(double valor, double operando);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  double result = 0.0;
  final numberOne = TextEditingController();
  final numberTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Material(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text(
                  result.toString(),
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        controller: numberOne,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Primeiro Número'))),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                        controller: numberTwo,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Segundo Número'))),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              child: const Text('+', textScaleFactor: 3),
                              onPressed: () {
                                setState(() {
                                  result = double.parse(numberOne.text.isEmpty
                                          ? numberOne.text
                                          : '0') +
                                      double.parse(numberTwo.text.isEmpty
                                          ? numberTwo.text
                                          : '0');
                                });
                              }),
                          ElevatedButton(
                              style: const ButtonStyle(),
                              child: const Text('-', textScaleFactor: 3),
                              onPressed: () {
                                setState(() {
                                  result = double.parse(numberOne.text.isEmpty
                                          ? numberOne.text
                                          : '0.0') -
                                      double.parse(numberTwo.text.isEmpty
                                          ? numberTwo.text
                                          : '0.0');
                                });
                              }),
                          ElevatedButton(
                              child: const Text('x', textScaleFactor: 3),
                              onPressed: () {
                                setState(() {
                                  result = double.parse(numberOne.text.isEmpty
                                          ? numberOne.text
                                          : '0') *
                                      double.parse(numberTwo.text.isEmpty
                                          ? numberTwo.text
                                          : '0');
                                });
                              }),
                          ElevatedButton(
                              child: const Text('/', textScaleFactor: 3),
                              onPressed: () {
                                setState(() {
                                  result = double.parse(
                                          !numberOne.text.isNotEmpty
                                              ? numberOne.text
                                              : '0') /
                                      double.parse(!numberTwo.text.isNotEmpty
                                          ? numberTwo.text
                                          : '0');
                                });
                              }),
                        ]))
              ])),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                result = 0.0;
                numberOne.text = '';
                numberTwo.text = '';
              });
            },
            child: const Text('C', textScaleFactor: 2),
          )),
    );
  }
}
