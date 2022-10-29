// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class ResultPage extends StatefulWidget {
  dynamic bmiValue;
  dynamic bmiConditions;
  ResultPage({super.key, required this.bmiValue, required this.bmiConditions});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future<void> _load() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: LiquidPullToRefresh(
        onRefresh: _load,
        showChildOpacityTransition: false,
        child: ListView(
          children: [
            SizedBox(
              height: 20.0,
            ),

            Center(
              child: Text(
                "Your Result",
                style: GoogleFonts.breeSerif(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            //bMi Details
            Container(
              padding: EdgeInsets.all(40.0),
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-4, -4),
                        color: Colors.white,
                        blurRadius: 8.0),
                    BoxShadow(
                        offset: Offset(4, 4),
                        color: Colors.grey.shade400,
                        blurRadius: 8.0),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Your BMI is : ",
                    style: GoogleFonts.breeSerif(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  Text(
                    widget.bmiValue.toString(),
                    style: GoogleFonts.breeSerif(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    width: 200,
                    child: Slider(
                      activeColor: Colors.green,
                      inactiveColor: Colors.blue,
                      value: widget.bmiValue,
                      max: 80,
                      min: 0,
                      onChanged: (value) {
                        setState(() {
                          widget.bmiValue = value;
                          print(widget.bmiValue);
                        });
                      },
                    ),
                  ),
                  Text(
                    widget.bmiConditions,
                    style: GoogleFonts.breeSerif(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            //Notations

            Container(
              padding: EdgeInsets.all(50.0),
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-4, -4),
                        color: Colors.white,
                        blurRadius: 8.0),
                    BoxShadow(
                        offset: Offset(4, 4),
                        color: Colors.grey.shade400,
                        blurRadius: 8.0),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "A BMI of 18.5 - 24.5 " +
                        "indicates that you're in good place.Keep up your healthy habits!",
                    style: GoogleFonts.breeSerif(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Text("Full Details--->"))
                ],
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            //share Buttons
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-4, -4),
                              color: Colors.white,
                              blurRadius: 8.0),
                          BoxShadow(
                              offset: Offset(4, 4),
                              color: Colors.grey.shade400,
                              blurRadius: 8.0),
                        ]),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Icon(Icons.share),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-4, -4),
                              color: Colors.white,
                              blurRadius: 8.0),
                          BoxShadow(
                              offset: Offset(4, 4),
                              color: Colors.grey.shade400,
                              blurRadius: 8.0),
                        ]),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.refresh),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
