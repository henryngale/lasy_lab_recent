import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/models/question.dart';

class SeeAnswer extends StatelessWidget {
  const SeeAnswer({Key? key, this.questions}) : super(key: key);
  final List<Question>? questions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#235390"),
        centerTitle: true,
        title: Text(
          "Réponses aux questions",
          style: GoogleFonts.nunito(
            color: Colors.white,
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: BackButton(),
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: questions!.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Question q = questions![index];
            return ListTile(
              horizontalTitleGap: 0,
              leading: Text(
                "${(index + 1).toString()} ) ",
                style: GoogleFonts.nunito(
                  color: Colors.black, // HexColor("#235390"),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                q.texte!,
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                "Réponse : ${q.correct!.texte!}",
                style: GoogleFonts.nunito(
                  color: HexColor("#235390"),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
