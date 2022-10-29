// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:bmical/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheel_chooser/wheel_chooser.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields

  String value = "ft";
  var _weight;
  var _age;
  var _heightInFeet;
  var _heightInInces;
  final double conversionValue = 0.304;
  double _bmiAns = 0;
  double _heightInMeter = 0;
  String bmiCondition = '';

  List<String> items = [
    "ft",
    "cm",
  ];

  //Bmi calculator
  void _bmiCalculator() {
    if (_heightInInces <= 9) {
      _heightInInces = _heightInInces / 10;
    }
    if (_heightInInces >= 10) {
      _heightInInces = _heightInInces / 100;
    }
    _heightInMeter = ((_heightInFeet + _heightInInces) * conversionValue);
    print("Your HeightIn meter  is : $_heightInMeter");

    double squareHeight = _heightInMeter * _heightInMeter;
    // print(" Heigh square in meter $squareHeight");
    _bmiAns = _weight / squareHeight;
    print("Your Bmi is : $_bmiAns");

    //checks for weight i.e underweight nomal or overweight

    if (_bmiAns < 18.5) {
      bmiCondition = "UnderWeight";
    } else if (_bmiAns >= 18.5 && _bmiAns <= 24.5) {
      bmiCondition = "healthy";
    }else{
      bmiCondition = "OverWeight";

    }

    // print("Errorr........");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("BMI Calculator",
                    style: GoogleFonts.breeSerif(
                        fontSize: 24, color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            //male female
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.grey.shade400,
                            blurRadius: 2.0),
                        BoxShadow(
                          offset: Offset(-5, -5),
                          color: Colors.white,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image(
                        height: 40,
                        width: 40,
                        image: AssetImage("assets/male.png")),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 5),
                            color: Colors.grey.shade400,
                            blurRadius: 10.0),
                        BoxShadow(offset: Offset(-5, -5), color: Colors.white),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image(
                        height: 40,
                        width: 40,
                        image: AssetImage("assets/female.png")),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20.0,
            ),

            //height
            Container(
              height: 250,
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 5),
                        color: Colors.grey.shade400,
                        blurRadius: 10.0),
                    BoxShadow(
                      offset: Offset(-5, -5),
                      color: Colors.white,
                    ),
                  ]),
              padding: EdgeInsets.all( 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height ft",
                        style: GoogleFonts.breeSerif(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey.shade700),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                     
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //cm boxes

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromARGB(255, 239, 241, 243),
                        ),

                        //Height in feet

                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: WheelChooser.integer(
                              itemSize: 50,
                              step: 1,
                              initValue: 2,
                              listHeight: 100,
                              listWidth: 100,
                              onValueChanged: (value) {
                                setState(() {
                                  _heightInFeet = value;
                                  print(
                                      "Height In feet is " + "$_heightInFeet");
                                });
                              },
                              maxValue: 12,
                              minValue: 1),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),

                      //Inces box
                      Container(
                        height: 150,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color.fromARGB(255, 221, 233, 243),
                            border: Border.all(color: Colors.blue, width: 2.0)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: WheelChooser.integer(
                              itemSize: 50,
                              step: 1,
                              initValue: 2,
                              listHeight: 100,
                              listWidth: 100,
                              onValueChanged: (value) {
                                setState(() {
                                  _heightInInces = value;
                                  print("Height In Inces is " +
                                      "$_heightInInces");
                                });
                              },
                              maxValue: 12,
                              minValue: 1),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            //weight and age

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Weight

                Container(
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.white, offset: Offset(-5, -5)),
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: Offset(5, 5),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Weight",
                        style: GoogleFonts.breeSerif(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade700),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(width: 2.0, color: Colors.blue),
                        ),
                        child: WheelChooser.integer(
                            itemSize: 50,
                            initValue: 25,
                            onValueChanged: (value) {
                              setState(() {
                                _weight = value;
                                print("Weoght is " + "$_weight");
                              });
                            },
                            maxValue: 100,
                            minValue: 0),
                      ),
                    ],
                  ),
                ),

                //age

                Container(
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.white, offset: Offset(-5, -5)),
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: Offset(5, 5),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Age",
                        style: GoogleFonts.breeSerif(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade700),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(width: 2.0, color: Colors.blue),
                        ),
                        child: WheelChooser.integer(
                            itemSize: 50,
                            initValue: 5,
                            onValueChanged: (value) {
                              setState(() {
                                _age = value;
                                print("Age is ; " + "${_age}");
                              });
                            },
                            maxValue: 100,
                            minValue: 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 320,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 25.0)),
                onPressed: () {
                  _bmiCalculator();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(bmiValue: _bmiAns,bmiConditions: bmiCondition,);
                    },
                  ));
                },
                child: Text(
                  "C A L C U L A T O R",
                  style: GoogleFonts.breeSerif(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
