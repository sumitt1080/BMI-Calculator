

import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  Color resultTextColor(){
    if(resultText == 'Normal')
     return Color(0xFF24D876);
     else if(resultText == 'Overweight')
     return Color(0xFFFF0000);
     else 
     return Color(0xFFFEE140);
  }

  Color bmiResultColor(){
    if(double.parse(bmiResult) >= 25.0)
     return Color(0xFFF76B1C);
     else if(double.parse(bmiResult) >= 18.5)
     return Colors.green;
     else 
     return Color(0xFFECCC41);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your BMI !',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: TextStyle(
                      color: resultTextColor(),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      color: bmiResultColor(),
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      
                    ),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            padding: EdgeInsets.all(20.0),
            color: kBottomContainerColour,
            child: Text('Recalculate BMI', style: kLargeButtonTextStyle),
            onPressed: () {
              Navigator.pop(context);
            },
            textColor: Colors.white60,
          ),
        ],
      ),
    );
  }
}
