import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';

class QuizDialog extends StatelessWidget {
  const QuizDialog(
      {Key? key,
      this.height,
      this.backgroundcolor,
      this.foregroundcolor,
      this.texte,
      this.onpress})
      : super(key: key);
  final double? height;
  final Color? backgroundcolor;
  final Color? foregroundcolor;
  final String? texte;
  final Function()? onpress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 200,
      color: backgroundcolor ?? HexColor("#FFDFE0"),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                top: 10,
                bottom: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$texte",
                  style: GoogleFonts.openSans(
                    color: foregroundcolor ?? HexColor("#FF4B4B"),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30,
                top: 10,
                bottom: 5,
              ),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: FancyButton(
                  child: Center(
                    child: Text(
                      "Continuer",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  size: 18,
                  color: foregroundcolor ?? HexColor("#FF4B4B"),
                  onPressed: onpress!,
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
