import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/activities_items.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  //int _value = 1;

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
          elevation: 2,
          backgroundColor: Colors.white,
          leadingWidth: 140,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset("assets/images/star.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/images/ruby.png"),
                  ),
                  Text(
                    "2",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/profil");
                },
                child: CircleAvatar(
                  child: Image.asset("assets/images/avatar.png"),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Center(
                child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: HexColor("#AFAFAF"),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(36),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "ACTIVITIES",
                      style: GoogleFonts.openSans(
                        color: HexColor("#AFAFAF"),
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Normale",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: HexColor("#E5E5E4"),
                width: double.infinity,
                height: 2.5,
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                childAspectRatio: (screenSize.width / screenSize.height * 1.3),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[
                  ActivitiesItem(
                    illustration: "assets/images/pen.png",
                    courseName: "Mathématiques",
                    description: "MATHS",
                  ),
                  ActivitiesItem(
                    illustration: "assets/images/maths.png",
                    courseName: "Mathématiques",
                    description: "MATHS",
                  ),
                  ActivitiesItem(
                    illustration: "assets/images/chemistry.png",
                    courseName: "Mathématiques",
                    description: "MATHS",
                  ),
                  ActivitiesItem(
                    illustration: "assets/images/pen.png",
                    courseName: "Mathématiques",
                    description: "MATHS",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Approfondissement",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: HexColor("#E5E5E4"),
                width: double.infinity,
                height: 2.5,
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                childAspectRatio: (screenSize.width / screenSize.height * 1.3),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[
                  ActivitiesItem(
                    illustration: "assets/images/pen.png",
                    courseName: "Mathématiques",
                    description: "MATHS",
                  ),
                  ActivitiesItem(
                    illustration: "assets/images/maths.png",
                    courseName: "Mathématiques",
                    description: "MATHS",
                  ),
                  ActivitiesItem(
                    illustration: "assets/images/chemistry.png",
                    courseName: "Mathématiques",
                    description: "MATHS",
                  ),
                  ActivitiesItem(
                    illustration: "assets/images/pen.png",
                    courseName: "Mathématiques",
                    description: "MATHS",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
