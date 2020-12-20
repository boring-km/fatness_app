import 'package:flutter/material.dart';

import 'bmi.dart';

class ResultPage extends StatelessWidget {

  final BMI bmi;
  ResultPage(this.bmi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산 결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(bmi.imageURL),
            Text(bmi.status),
          ],
        ),
      ),
    );
  }
}
