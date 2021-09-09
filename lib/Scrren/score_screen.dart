import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:quiztest/Scrren/last_screen.dart';

class ScoreScreen extends StatefulWidget {
  final int? score;

  const ScoreScreen({Key? key, this.score}) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String hexString = "F1F0F0";
  var _nomController = TextEditingController();
  var _prenomController = TextEditingController();
  var _mailController = TextEditingController();

  Future sendEmail({
    required String name,
    required String to_email,
    required String email,
    required String subject,
    required String message,
  }) async {
    final serviceId = 'service_wod7a0n';
    final templateId = 'template_rp6muyg';
    final userId = 'user_EK45oipvfzAlpPt7fgsyj';
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url,
        headers: {'Content-type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'to_email': to_email,
            'user_subject': "Resultat pour le test testosterone",
            'user_message': infoScore(),
          }
        }));
    print(response.body);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LastScreen(
                nameUser: "${_nomController.text} ${_prenomController.text}")));
  }

  Future add() async {
    final response = await http.post(
        Uri.http(
            "https://backend-projet-testosterone.herokuapp.com/users/newuser",
            "/users/newuser"),
        headers: {
          "accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "first_name": _nomController.text,
          "last_name": _prenomController.text,
          "email": _mailController.text,
        }));
    print(response.body);
  }

  infoScore() {
    if (widget.score! >= 17 && widget.score! < 24) {
      return 'Si vous souffrez de quelques « troubles », il y a fort à parier que ce n’est pasdû à votre testostérone. Félicitations, votre taux de testostérone est sansdoute dans la moyenne.';
    } else if (widget.score! >= 24 && widget.score! < 32) {
      return 'Il est possible que vous manquiez légèrement de testostérone. Ce n’est pas un problème. Surveillez votre alimentation (je vous en parle dans ma prochaine lettre), faites de l’exercice, et cela devrait aller mieux. N’hésitez pas à mesurer votre taux de testostérone avec une prise de sang si cela vous inquiète.';
    } else if (widget.score! >= 32 && widget.score! < 47) {
      return "Votre taux de testostérone est probablement en-dessous de la norme. Prenez au sérieux les conseils de ma prochaine lettre et mettez-les en application – cela devrait changer la donne pour vous. N’hésitez pas à mesurer votre taux de testostérone avec une prise de sang si cela vous inquiète.";
    } else if (widget.score! >= 47) {
      return "Il y a sans doute un vrai problème avec votre taux de testostérone. Heureusement, ce n’est pas une fatalité. Vous pouvez sécréter beaucoup plus de testostérone naturellement grâce aux 11 conseils de ma prochaine lettre. Vous devriez consulter un médecin et mesurer votre taux de testostérone, histoire de tirer les choses au clair.";
    }
  }
/*
  Future<void> send() async {
    final Email email = Email(
      isHTML: false,
      body: infoScore(),
      subject: "Your Test Teststerone",
      recipients: [_mailController.text],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: size.height,
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
                height: 80,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: (width /7)),
                    width: (width / 5),
                    height: 400,
                    child: Image.asset("assets/images/muscle.png"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                            children: [
                      Container(

                        child:Text(
                          "Remplissez le formulaire ci-dessous\npour découvrir le résultat",
                          style: GoogleFonts.oswald(
                              letterSpacing: 0,
                              textStyle: Theme.of(context).textTheme.headline6,
                              fontSize: 22,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        margin: EdgeInsets.only(right: 6),
                        width:  (width / 5) * 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(int.parse("0xff${hexString}")),
                        ),
                        child: TextField(
                          controller: _nomController,
                          decoration: InputDecoration(
                            hintText: 'Votre Nom',
                            hintStyle: GoogleFonts.oswald(
                                color: Colors.grey[500], fontSize: 20),
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width:   (width / 5) * 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(int.parse("0xff${hexString}")),
                        ),
                        child: TextField(
                          controller: _prenomController,
                          decoration: InputDecoration(
                            hintText: 'Votre Prenom',
                            hintStyle: GoogleFonts.oswald(
                                color: Colors.grey[500], fontSize: 20),
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width:   (width / 5) * 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(int.parse("0xff${hexString}")),
                        ),
                        child: TextField(
                          controller: _mailController,
                          decoration: InputDecoration(
                            hintText: 'Votre Email',
                            hintStyle: GoogleFonts.oswald(
                                color: Colors.grey[500], fontSize: 20),
                            prefixIcon: Icon(Icons.mail),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width:   (width / 5) * 3,
                        height: 70,
                        child: RaisedButton.icon(
                          color: Colors.amber,
                          textColor: Colors.white,
                          onPressed: () {
                            sendEmail(
                                name:
                                    "${_nomController.text} ${_prenomController.text}",
                                to_email: _mailController.text,
                                email: "contact.sinamiamine@gmail.com",
                                subject: "Test Testosterone",
                                message: infoScore());
                          },
                          icon: Icon(
                            Icons.view_in_ar,
                            color: Colors.white,
                          ),
                          label: Text("Valider"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
