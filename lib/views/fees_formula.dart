import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/views/menu.dart';

class FeesFormula extends StatefulWidget {
  const FeesFormula({Key? key}) : super(key: key);

  @override
  _FeesFormulaState createState() => _FeesFormulaState();
}

class _FeesFormulaState extends State<FeesFormula> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
              value: 0.66,
              valueColor: AlwaysStoppedAnimation<Color>(
                HexColor("#58CC02"),
              ),
              backgroundColor: HexColor("#E5E5E5"),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            "Choisis une formule",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              color: Color.fromARGB(255, 0, 0, 0),
              textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenSize.height * 0.13),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              "Recommandé pour vous",
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                color: HexColor("#FF3A47"),
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Confort 6 mois",
                textAlign: TextAlign.left,
                style: GoogleFonts.nunito(
                  color: HexColor("#1899D6"),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Essai gratuit 7 jours",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      color: HexColor("#000000"),
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "30 000 F CFA/\n6 mois",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      color: HexColor("#000000"),
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 150.0,
              top: 20.0,
              bottom: 10.0,
            ),
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Essayer l'offre",
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
                  showOtpBox();
                },
                duration: const Duration(milliseconds: 160),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 2,
              color: HexColor("#AFAFAF"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Text(
              "Sans engagement",
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                color: HexColor("#000000"),
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Premium 1 mois",
                textAlign: TextAlign.left,
                style: GoogleFonts.nunito(
                  color: HexColor("#1899D6"),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Essai gratuit 7 jours",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      color: HexColor("#000000"),
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "6990 F CFA/\n6 mois",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      color: HexColor("#000000"),
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 10,
              right: 150,
            ),
            child: SizedBox(
              height: 45,
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Essayer l'offre",
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Menu(),
                  ));
                  //
                },
                duration: const Duration(milliseconds: 160),
              ),
            ),
          ),
          Text(
            "Questions Fréquentes",
            textAlign: TextAlign.left,
            style: GoogleFonts.nunito(
              color: HexColor("#000000"),
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
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
    );
  }

  void showOtpBox() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Entrez votre code de paiement",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              color: HexColor("#000000"),
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  key: UniqueKey(),
                  child: new TextField(
                    onTap: () {},
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HexColor("#1CB0F6"),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
                Container(
                  key: UniqueKey(),
                  child: new TextField(
                    onTap: () {},
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HexColor("#1CB0F6"),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
                Container(
                  key: UniqueKey(),
                  child: new TextField(
                    onTap: () {},
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HexColor("#1CB0F6"),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
                Container(
                  key: UniqueKey(),
                  child: new TextField(
                    onTap: () {},
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HexColor("#1CB0F6"),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#1CB0F6"),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "ENVOYER",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      color: HexColor("#FFFFFF"),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
