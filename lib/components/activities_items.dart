import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ActivitiesItem extends StatefulWidget {
  final String courseName;
  final String description;
  final String illustration;

  const ActivitiesItem({
    Key? key,
    required this.courseName,
    required this.description,
    required this.illustration,
  }) : super(key: key);

  @override
  State<ActivitiesItem> createState() => _ActivitiesItemState();
}

class _ActivitiesItemState extends State<ActivitiesItem> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/quiz_answer");
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        elevation: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: screenSize.width * 0.20 > 90 ? 120 : 60,
                width: screenSize.width * 0.20 > 90 ? 120 : 60,
                child: Image.asset(widget.illustration),
              ),
            ),
            Text(
              widget.courseName,
              style: GoogleFonts.nunito(
                color: Colors.black,
                textStyle: TextStyle(
                  fontSize: screenSize.width * 0.20 > 90 ? 18 : 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.description,
                  style: GoogleFonts.nunito(
                    color: HexColor("#CCCCCC"),
                    textStyle: TextStyle(
                      fontSize: screenSize.width * 0.20 > 90 ? 14 : 12,
                      fontWeight: FontWeight.bold,
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
