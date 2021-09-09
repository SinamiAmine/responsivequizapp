import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LastScreen extends StatefulWidget {
  final String? nameUser;
  const LastScreen({Key? key, this.nameUser}) : super(key: key);

  @override
  _LastScreenState createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
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
            child: Column(
              children: [
                SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: (width /8)),
                      width: (width / 8),
                      height: 400,
                      child: Image.asset("assets/images/muscle.png"),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 6),
                        width: (width / 4) * 3,
                        height: 450,
                        child: Center(
                          child: Text(
                            "merci de bien vouloir vérifier Mr/Mme ${widget.nameUser} votre boîte mail pour obtenir le résultat et aussi nous avons donneé des conseills par rapport son taux de testostérone ",
                            style: GoogleFonts.oswald(
                              fontSize: 25,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
