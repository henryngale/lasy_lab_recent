import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';
import 'package:lasylab_mobile_app/views/opt_reset.dart';
import 'package:logger/logger.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen>
    with TickerProviderStateMixin {
  late TextEditingController telephone;
  final formGlobalKey = GlobalKey<FormState>();
  bool isloading = false;
  late bool result;
  AnimationController? animationcontroller;

  @override
  void initState() {
    super.initState();
    telephone = TextEditingController();
    animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    animationcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FCF6F4"),
        body: Form(
          key: formGlobalKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.1),
                SizedBox(
                  height: screenSize.height * 0.65,
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
                      child: Center(
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 8.0,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: BackButton(
                                  color: HexColor("#AFAFAF"),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                  right: 25.0,
                                ),
                                child: Container(
                                  height: screenSize.height * 0.036,
                                  width: screenSize.width * 0.26,
                                  child: Image.asset(
                                    "assets/images/splash.png",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Reset Account",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  textStyle: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Entrer votre numéro de téléphone";
                                        } else if (value.trim().length < 9) {
                                          return "Numéro de télephone incorrect";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: telephone,
                                      decoration: InputDecoration(
                                        labelText: "Téléphone",
                                        prefixText: '+237',
                                        hintStyle: TextStyle(fontSize: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ], // Only numbers can be entered
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 15,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Remeber password ? ",
                                    style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20.0,
                                right: 20,
                                top: 50,
                              ),
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: FancyButton(
                                  child: isloading
                                      ? Center(
                                          child: SpinKitWave(
                                            color: Colors.white,
                                            size: 25,
                                            controller: animationcontroller,
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            "Reset",
                                            style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                  size: 18,
                                  color: HexColor("#58CC02"),
                                  onPressed: isloading
                                      ? () {}
                                      : () async {
                                          if (formGlobalKey.currentState!
                                              .validate()) {
                                            try {
                                              setState(() {
                                                isloading = true;
                                              });
                                              result = await DBService()
                                                  .verifyIfPhoneExist(
                                                      telephone.text);
                                              if (result) {
                                                Fluttertoast.showToast(
                                                  msg:
                                                      "Phone Verification Succesfull",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 4,
                                                  backgroundColor:
                                                      HexColor("#58CC02"),
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                );
                                                setState(() {
                                                  isloading = false;
                                                });
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OTPreset(
                                                        telephone:
                                                            telephone.text,
                                                      ),
                                                    ),
                                                    (route) => false);
                                              } else {
                                                setState(() {
                                                  isloading = false;
                                                });
                                                Fluttertoast.showToast(
                                                  msg:
                                                      "Une erreur est survenue",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 4,
                                                  backgroundColor:
                                                      HexColor("#58CC02"),
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                );
                                              }
                                            } catch (e) {
                                              Logger().d(e);
                                              setState(() {
                                                isloading = false;
                                              });
                                              Fluttertoast.showToast(
                                                msg: "Une erreur est survenue",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 4,
                                                backgroundColor:
                                                    HexColor("#58CC02"),
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                            }
                                          }
                                        },
                                  duration: const Duration(milliseconds: 160),
                                ),
                              ),
                            ),
                          ],
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
}
