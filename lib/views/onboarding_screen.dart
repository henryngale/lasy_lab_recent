import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/models/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  final box = GetStorage();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: HexColor("#FCF6F4"),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor("#FCF6F4"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.84,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        side: BorderSide(
                          width: 1,
                          color: HexColor("#D2E4E8"),
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: _controller,
                              itemCount: contents.length,
                              onPageChanged: (int index) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              itemBuilder: (_, i) {
                                return Column(
                                  children: [
                                    FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 25.0,
                                          right: 25.0,
                                          top: 25.0,
                                        ),
                                        child: Container(
                                          height: screenSize.height * 0.08,
                                          width: screenSize.width * 0.45,
                                          child: Image.asset(
                                            "assets/images/splash.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          contents[i].title,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                            color: Colors.black,
                                            textStyle: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    currentIndex == 0
                                        ? FittedBox(
                                            child: SizedBox(
                                              height: screenSize.height * 0.25,
                                              width: screenSize.width * 0.8,
                                              child: Lottie.asset(
                                                "assets/json/welcome.json",
                                                animate: true,
                                              ),
                                            ),
                                          )
                                        : FittedBox(
                                            child: SvgPicture.asset(
                                              contents[i].image,
                                              height: screenSize.height * 0.25,
                                              width: screenSize.width * 0.8,
                                            ),
                                          ),
                                    SizedBox(height: 10),
                                    FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          contents[i].description,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                            color: Colors.grey,
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  contents.length,
                                  (index) => buildDot(index, context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    right: 30.0,
                    bottom: 5,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        if (currentIndex == contents.length - 1) {
                          box.write("onboarding", true);
                          Navigator.of(context).pushNamed("/preinscription");
                        }
                        _controller.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: FittedBox(
                        child: Text(
                          currentIndex == contents.length - 1
                              ? "Terminer"
                              : "Suivant",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 10 : 10, //25 : 10 before
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? HexColor("#1CB0F6")
            : HexColor("#C4C4C4"), //Theme.of(context).primaryColor,
      ),
    );
  }
}
