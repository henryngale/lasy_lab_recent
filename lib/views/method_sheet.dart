import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/course_tile_item.dart';

class MethodSheet extends StatefulWidget {
  const MethodSheet({Key? key}) : super(key: key);

  @override
  State<MethodSheet> createState() => _MethodSheetState();
}

class _MethodSheetState extends State<MethodSheet> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: screenSize.height * 0.28,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.asset(
                      "assets/images/revision_background.png",
                      fit: BoxFit.contain,
                    ),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: screenSize.height * 0.05,
                            width: screenSize.width * 0.35,
                            child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              child: Text(
                                "Methodes",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: HexColor("#1CB0F6"),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Mathématiques",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Gagner du temps dans vos révisions à travers des vidéos explicatives.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: HexColor("#FFFFFF"),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              leading: BackButton(
                color: Colors.white,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "CHAPITRE I : Équation",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 2,
                        thickness: 2,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed("/course_status");
                    },
                    focusColor: Colors.blue,
                    tileColor: Colors.white,
                    leading: CourseTileItem(
                      backgroundColor: HexColor("#1CB1FB"),
                      icon: FontAwesomeIcons.calculator,
                      progression: 0.8,
                    ),
                    title: Text(
                      "Equation et inéquation",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: HexColor("#000000"),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      "1 jour",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: HexColor("#AFAFAF"),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 3,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "CHAPITRE II : PARTIE",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 2,
                        thickness: 2,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed("/course_status");
                    },
                    focusColor: Colors.blue,
                    tileColor: Colors.white,
                    leading: CourseTileItem(
                      backgroundColor: HexColor("#1CB1FB"),
                      icon: FontAwesomeIcons.calculator,
                      progression: 0.8,
                    ),
                    title: Text(
                      "Equation et inéquation",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: HexColor("#000000"),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      "1 jour",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: HexColor("#AFAFAF"),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
