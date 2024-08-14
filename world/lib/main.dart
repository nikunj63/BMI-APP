// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Your BMI",style: TextStyle(color: Colors.white,fontSize: 30), ),
          backgroundColor: Colors.indigo.shade300,
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 21),
                  TextField(
                    controller: wtcontroller,
                    decoration: InputDecoration(
                      label: Text("Enter Your Weight (in kg)"),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11),
                  TextField(
                    controller: ftcontroller,
                    decoration: InputDecoration(
                      label: Text("Enter Your Height (in Feet)"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11),
                  TextField(
                    controller: inchcontroller,
                    decoration: InputDecoration(
                      label: Text("Enter your Height (in inch)"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      var wt = wtcontroller.text;
                      var ft = ftcontroller.text;
                      var inch = inchcontroller.text;
          
                      if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                        // BMI calculation
                        var iwt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);
          
                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iwt / (tM * tM);
                        var msg = "";

                        if (bmi>25) {
                          msg = "You are OverWeight!!";
                          bgColor = Colors.orange.shade200;
                        }else if(bmi<18){
                          msg = "You are UnderWeight!!";
                          bgColor = Colors.red.shade200;
                        }else{
                          msg = "You're Healthy!!";
                          bgColor = Colors.green.shade200;
                        }
          
                        setState(() {
                          result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the blanks";
                        });
                      }
                    },
                    child: Text("Calculate"),
                  ),
          
                  SizedBox(height: 11,),
          
                  Text(
                    result,
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
