import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/models/user.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';
import 'package:lasylab_mobile_app/views/biographie.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  //int _value = 1;
  Usermodel? user;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    user = DBService().getLocalUser();
  }

  @override
  Widget build(BuildContext context) {
    //var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: HexColor("#AFAFAF"),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20.0),
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
              Center(
                child: Text(
                  "${user!.nom} ${user!.prenom}",
                  maxLines: 1,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Informations personnelles",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Mes informations',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  color: HexColor("#4B4B4B"),
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text("Nom : ${user!.nom ?? ""}"),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child:
                                        Text("Prénom : ${user!.prenom ?? ""}"),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                        "Date de naissance : ${DateFormat('yyyy-MM-dd').format(user!.dateNaiss!)}"),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child:
                                        Text("Classe : ${user!.classe ?? ""}"),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text("Ecole : ${user!.ecole ?? ""}"),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child:
                                        Text("Téléphone : ${user!.telephone}"),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Ok',
                                    style: GoogleFonts.openSans(
                                      color: HexColor("#4B4B4B"),
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          });
                    },
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Numéro de téléphone",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),*/
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Ma classe",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Ma biographie",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BiographiePage(),
                        ),
                      );
                    },
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Mot de passe",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Mon Parent",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Ecole",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Aide",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "À propos de nous",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "${user!.telephone}",
                    style: GoogleFonts.openSans(
                      color: HexColor("#1CB0F6"),
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
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
