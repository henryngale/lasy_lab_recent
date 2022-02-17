import 'package:flutter/material.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';
import '../models/user.dart';
import 'package:google_fonts/google_fonts.dart';

Usermodel? user = DBService().getLocalUser();

class Welcome {
  showWelcome(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            contentPadding: EdgeInsets.zero,
            title: Center(
              child: Text(
                "Bienvenu ${user!.nom} ${user!.prenom}",
                maxLines: 1,
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            content: Container(
              height: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Hero(
                          tag: "profile_pic",
                          child: Image.asset(
                            "assets/images/avatar.png",
                            scale: 1 / 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/welcome.png",
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  // Container(
                  //   height: 20,
                  //   child: Text("Votre réussite, notre priorité"),
                  // ),
                ],
              ),
            ),
          );
        });
  }
}
