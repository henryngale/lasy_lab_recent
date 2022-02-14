import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/models/question.dart';
import 'package:lasylab_mobile_app/views/see_answer.dart';

class Congratulations extends StatefulWidget {
  const Congratulations(
      {Key? key, this.nbretrouves, this.nbretotal, this.questions})
      : super(key: key);
  final int? nbretrouves;
  final int? nbretotal;
  final List<Question>? questions;

  @override
  _CongratulationsState createState() => _CongratulationsState();
}

class _CongratulationsState extends State<Congratulations> {
  late ConfettiController controllerCenter;

  @override
  void initState() {
    super.initState();
    controllerCenter =
        ConfettiController(duration: const Duration(seconds: 30));
    if (mounted) {
      controllerCenter.play();
    }
  }

  @override
  void dispose() {
    controllerCenter.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Félicitations\nQuiz terminé !",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                color: HexColor("#FF6711"),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          /*SizedBox(
            width: double.infinity,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/excellent.png"),
            ),
          ),*/
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/correct.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.yellow),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        "${widget.nbretrouves}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          color: Colors.yellow,
                          textStyle: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      " / ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: Colors.yellow,
                        textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        " ${widget.nbretotal}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          color: Colors.yellow,
                          textStyle: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 40.0,
              right: 40,
              top: 8.0,
            ),
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Voir les reponses",
                    style: GoogleFonts.openSans(
                      color: HexColor("#1CB0F6"),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                size: 18,
                color: HexColor("#FFFFFF"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SeeAnswer(
                            questions: widget.questions,
                          )));
                },
                duration: const Duration(milliseconds: 160),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 40.0,
              right: 40,
              top: 8.0,
              bottom: 20,
            ),
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Continuer",
                    style: GoogleFonts.openSans(
                      color: HexColor("#FFFFFF"),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                size: 18,
                color: HexColor("#1CB0F6"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/menu");
                },
                duration: const Duration(milliseconds: 160),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
