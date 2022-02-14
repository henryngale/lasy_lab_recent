import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';

//import 'login.dart';

class PreInscription extends StatelessWidget {
  const PreInscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FCF6F4"),
        body: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.85,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: HexColor("#D2E4E8"),
                    ),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Container(
                            height: screenSize.height * 0.08,
                            width: screenSize.width * 0.45,
                            child: Image.asset(
                              "assets/images/splash.png",
                            ),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: SvgPicture.asset(
                          "assets/svg/sit_reading.svg",
                          height: screenSize.height * 0.2,
                          width: screenSize.width * 0.8,
                        ),
                      ),
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Réussis ton année !",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Fais partie de ceux qui reussissent",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              color: Colors.grey,
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 25,
                        ),
                        child: SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: FancyButton(
                            child: Center(
                              child: Text(
                                "je m'inscris",
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            size: 18,
                            color: HexColor("#58CC02"),
                            onPressed: () {
                              Navigator.of(context).pushNamed("/register");
                            },
                            duration: const Duration(milliseconds: 160),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      text: 'Tu as déjà un compte ? ',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Connecte-toi!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed("/login");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
