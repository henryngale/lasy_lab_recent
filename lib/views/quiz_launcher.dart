import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';


class QuizLauncher extends StatefulWidget {
  const QuizLauncher({Key? key}) : super(key: key);

  @override
  _QuizLauncherState createState() => _QuizLauncherState();
}

class _QuizLauncherState extends State<QuizLauncher> {
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
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Equation et inéquation",
            textAlign: TextAlign.left,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Center(
              child: SizedBox(
                width: screenSize.width * 0.55,
                height: screenSize.height * 0.55,
                child: Image.asset(
                  "assets/images/quiz_valided.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 40,
                right: 40,
              ),
              child: SizedBox(
                height: 45,
                child: FancyButton(
                  child: Center(
                    child: Text(
                      "Passer le Quiz",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  size: 18,
                  color: HexColor("#58CC02"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/quiz_answer");
                  },
                  duration: const Duration(milliseconds: 160),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
