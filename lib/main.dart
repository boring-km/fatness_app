import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '비만도 계산기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '비만도 계산기'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 0;
  double weight = 0;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: '키 입력(cm)'),
              onChanged: (String value) {
                // ignore: deprecated_member_use
                setState(() => height = double.parse(value, onError) / 100);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: '몸무게 입력(kg)'),
              onChanged: (String value) {
                // ignore: deprecated_member_use
                setState(() => weight = double.parse(value, onError));
              },
            ),
            RaisedButton(
              child: Text('BMI 계산하기'),
              color: Colors.deepOrange,
              onPressed: () {
                setState(() {
                  bmi = weight / (height * height);
                });
              },
            ),
            Text('$bmi')
          ],
        ),
      ),
    );
  }

  double onError(value) {
    setState(() {
      return 0;
    });
  }

  // TODO 비만도 계산하고 다음 화면으로 결과 넘기기
}
