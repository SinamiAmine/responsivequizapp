import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiztest/Scrren/score_screen.dart';
import 'package:quiztest/data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedIndex = 0;
  int score = 0;
  int scorePrecedent = 0;
  int currentQuestion = 0;
  int indexQuestion = 0;
  int resultatFinal = 0;
  bool isPressed = false;
  //List<Reponse>? _reponses;
  //List<Question>? _questions;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }
/*
  static List<Reponse>? parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Reponse>((json) => Reponse.fromJson(json)).toList();
  }

  //Future method to read the URL
  fetchInfoReponse() async {
    final response = await http.get(Uri.http(ipAddress, "reponses"));
    final jsonresponse = parseResponse(response.body);
    if (mounted) {
      setState(() {
        _reponses = jsonresponse;
        print(_reponses);
      });
    }
  }

  static List<Question>? parseResponsee(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Question>((json) => Question.fromJson(json)).toList();
  }

  //Future method to read the URL
  fetchInfoQuestion() async {
    final response = await http.get(Uri.http(ipAddress, "questions"));
    final jsonresponse = parseResponsee(response.body);
    if (mounted) {
      setState(() {
        _questions = jsonresponse;
        print(_questions);
      });
    }
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_reponses = [];
    //_questions = [];
    //fetchInfoReponse();
    //fetchInfoQuestion();
  }

  @override
  Widget build(BuildContext context) {
    String hexString = "F1F0F0";
    Size size = MediaQuery.of(context).size;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton.icon(
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              isPressed == true;
                              if (currentQuestion + 1 < questions!.length) {
                                --currentQuestion;
                                --indexQuestion;
                                print(scorePrecedent);
                              }
                            });
                          },
                          icon: SvgPicture.asset(
                            "assets/images/arrow_one.svg",
                          ),
                          label: Text("Précedent")),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: new CircularPercentIndicator(
                            progressColor: Colors.amber,
                            radius: 130.0,
                            lineWidth: 12.0,
                            animation: false,
                            percent: double.parse(
                                        "${currentQuestion / questions!.length * 100} ")
                                    .round() /
                                100,
                            center: new Text(
                              "${currentQuestion + 1}/${questions!.length}",
                              style: new TextStyle(fontSize: 18.0),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Question N${currentQuestion + 1}",
                      style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.headline6,
                          fontSize: 22,
                          color: Colors.amber),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      questions!.length != 0
                          ? questions![indexQuestion]["q"].toString()
                          : 'No Question',
                      style: GoogleFonts.oswald(
                          letterSpacing: 0,
                          textStyle: Theme.of(context).textTheme.headline6,
                          fontSize: 22,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: (width / 7)),
                        width: (width / 5),
                        height: 400,
                        child: Image.asset("assets/images/muscle.png"),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: (width / 5) * 3,
                        height: height / 2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: reponses!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _onSelected(index);
                                setState(() {
                                  score += int.parse(
                                      reponses![index]['num'].toString());
                                });
                                print(scorePrecedent);
                                print(score);
                              },
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: _selectedIndex != null &&
                                                  _selectedIndex == index
                                              ? Colors.amber
                                              : Color(int.parse(
                                                  "0xff${hexString}")),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Container(
                                                height: 32,
                                                width: 32,
                                                color: _selectedIndex != null &&
                                                        _selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.amber,
                                                child: Center(
                                                    child: Text(
                                                  '${reponses![index]['num'].toString()}',
                                                  style: GoogleFonts.oswald(
                                                      color: _selectedIndex !=
                                                                  null &&
                                                              _selectedIndex ==
                                                                  index
                                                          ? Colors.amber
                                                          : Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '${reponses![index]['q'].toString()}',
                                                    style: GoogleFonts.oswald(
                                                        color: _selectedIndex !=
                                                                    null &&
                                                                _selectedIndex ==
                                                                    index
                                                            ? Colors.white
                                                            : Colors.grey[500],
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: (width / 5) * 3),
                    width: (width / 5) * 2,
                    height: height / 10,
                    child: RaisedButton(
                      color: Colors.amber,
                      onPressed: () {
                        setState(() {
                          if (currentQuestion + 1 < questions!.length) {
                            ++currentQuestion;
                            ++indexQuestion;
                          } else if (currentQuestion + 1 >= questions!.length) {
                            //showAlertDialog(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScoreScreen(
                                          score: score,
                                        )));
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                currentQuestion + 1 >= questions!.length
                                    ? "Resultat"
                                    : 'Suivant',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_alt,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
