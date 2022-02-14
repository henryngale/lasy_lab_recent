import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';

class WelcomeFees extends StatefulWidget {
  const WelcomeFees({Key? key}) : super(key: key);

  @override
  _WelcomeFeesState createState() => _WelcomeFeesState();
}

class _WelcomeFeesState extends State<WelcomeFees> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarColor: Colors.white, //HexColor("#FCF6F4"),
        statusBarIconBrightness: Brightness.dark, // status bar color
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: HexColor("#AFAFAF"),
            ),
          ),
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: screenSize.width * 0.9,
            height: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: LinearProgressIndicator(
                value: 0.33,
                valueColor: AlwaysStoppedAnimation<Color>(
                  HexColor("#58CC02"),
                ),
                backgroundColor: HexColor("#E5E5E5"),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                "Bienvenue",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.15),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 15,
                  right: 15,
                ),
                child: Text(
                  "Essai gratuitement tous nos\nservice pendant 7 jours.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 15.0,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor("#DDF4FF"),
                        border: Border.all(
                          color: HexColor("#1899D6"),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      height: 80,
                      child: FittedBox(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Offre Premium",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor("#1899D6"),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: HexColor("#E5E5E5"),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Text(
                              "6990 FCFA/mois",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor("#4B4B4B"),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "\u2022 Fiches de cours, méthodes",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor("#4B4B4B"),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "\u2022 Quiz",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor("#4B4B4B"),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "\u2022 Cours vidéo explicatifs",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor("#4B4B4B"),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "\u2022 Télécharge tes cours",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor("#4B4B4B"),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "\u2022 Chat avec un prof",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor("#4B4B4B"),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "\u2022 Epreuves corrigées",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor("#4B4B4B"),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "\u2022 Emplois de temps\n   apprentissage",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: HexColor("#4B4B4B"),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              top: 20.0,
                              bottom: 10.0,
                            ),
                            child: SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: FancyButton(
                                child: Center(
                                  child: Text(
                                    "Essayer gratuitement",
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                size: 18,
                                color: HexColor("#58CC02"),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed("/fees_formula");
                                },
                                duration: const Duration(milliseconds: 160),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 30,
                  bottom: 10.0,
                ),
                child: Text(
                  "Pas maintanant, j’accepte uniquement aux 10 contenus gratuit",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: HexColor("#1899D6"),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
