import 'package:fatness_app/result.dart';
import 'package:flutter/material.dart';

import 'bmi.dart';

void main() {
  runApp(FatnessApp());
}

class FatnessApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '비만도 계산기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(title: '비만도 계산기'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double height = 0;
  double weight = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage('assets/background.jpg'))),
      child: Scaffold(
          backgroundColor: Color.fromARGB(50, 255, 255, 255),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                setTitle(),
                setSimpsonImage(),
                setDataInput(),
                setButton(context),
              ],
            ),
          )),
    );
  }

  RaisedButton setButton(BuildContext context) {
    return RaisedButton(
                child: Text(
                  'BMI 계산하기',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepOrange,
                onPressed: () {
                  setState(() {
                    BMI result = new BMI(height, weight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(result)));
                  });
                },
              );
  }

  Container setDataInput() {
    return Container(
                color: Color.fromRGBO(255, 255, 255, 50.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '키 입력(cm)'),
                      onChanged: (String value) {
                        // ignore: deprecated_member_use
                        setState(() =>
                            height = double.parse(value) / 100);
                      },
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '몸무게 입력(kg)'),
                      onChanged: (String value) {
                        // ignore: deprecated_member_use
                        setState(() => weight = double.parse(value));
                      },
                      keyboardType: TextInputType.number
                    ),
                  ],
                ),
              );
  }

  Padding setSimpsonImage() {
    return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50.0),
                  child: Image.asset('assets/fatness.jpg'));
  }

  Padding setTitle() {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '비만도 계산기',
                      style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NanumSquareRound'),
                    ),
                  ),
                ),
              );
  }
}
