import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/services/auth_service.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';
import 'package:lasylab_mobile_app/views/menu.dart';
import 'package:logger/logger.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/welcome.dart';

class OTPreset extends StatefulWidget {
  const OTPreset({
    Key? key,
    required this.telephone,
  }) : super(key: key);

  final String telephone;
  @override
  _OTPresetState createState() => _OTPresetState();
}

class _OTPresetState extends State<OTPreset> with TickerProviderStateMixin {
  final formGlobalKey = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  bool loading = false;
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  // ignore: unused_element
  void _showSnackBar(String pin) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  bool visible = false;
  var password = TextEditingController();
  bool passwordObscure = true;
  AuthService authservice = AuthService();
  String? verificationCode;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  bool isloading = false;
  AnimationController? animationcontroller;
  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
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
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 110),
            Center(
              child: Visibility(
                visible: !visible,
                child: Container(
                  height: 400,
                  child: Form(
                    key: formGlobalKey,
                    child: ListView(primary: true, children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                        ),
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
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    bottom: 12,
                                    top: 15,
                                  ),
                                  child: Container(
                                    height: 72,
                                    width: 141,
                                    child: Image.asset(
                                      "assets/images/splash.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "OTP Verification To\n Reset Password",
                                    style: GoogleFonts.nunito(
                                      color: Colors.black,
                                      textStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Center(
                                    child: Text(
                                      "Téléphone : +237" + widget.telephone,
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
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: isloading
                                      ? Center(
                                          child: SpinKitWave(
                                            color: HexColor("#58CC02"),
                                            size: 25,
                                            controller: animationcontroller,
                                          ),
                                        )
                                      : PinPut(
                                          fieldsCount: 6,
                                          withCursor: true,
                                          textStyle: GoogleFonts.nunito(
                                            color: Colors.white,
                                            textStyle: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          eachFieldWidth: 10.0,
                                          eachFieldHeight: 10.0,
                                          //onSubmit: (String pin) => _showSnackBar(pin),
                                          focusNode: _pinPutFocusNode,
                                          controller: _pinPutController,
                                          submittedFieldDecoration:
                                              pinPutDecoration,
                                          selectedFieldDecoration:
                                              pinPutDecoration,
                                          followingFieldDecoration:
                                              pinPutDecoration,
                                          pinAnimationType:
                                              PinAnimationType.fade,
                                          onSubmit: (String pin) async {
                                            try {
                                              setState(() {
                                                isloading = true;
                                              });
                                              await FirebaseAuth.instance
                                                  .signInWithCredential(
                                                PhoneAuthProvider.credential(
                                                  verificationId:
                                                      verificationCode!,
                                                  smsCode: pin,
                                                ),
                                              )
                                                  .then((value) async {
                                                if (value.user != null) {
                                                  Logger().d(
                                                      'pass to reset dialog');
                                                  setState(() {
                                                    isloading = false;
                                                    visible = !visible;
                                                  });
                                                }
                                              });
                                            } on FirebaseAuthException catch (e) {
                                              if (e.code == 'weak-password') {
                                                Logger().d(
                                                    'The password provided is too weak.');
                                              } else if (e.code ==
                                                  'email-already-in-use') {
                                                Logger().d(
                                                    'The account already exists for that email.');
                                              }
                                            } catch (e) {
                                              setState(() {
                                                isloading = false;
                                              });
                                              FocusScope.of(context).unfocus();
                                              Fluttertoast.showToast(
                                                  msg: "Code OTP invalide",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 4,
                                                  backgroundColor:
                                                      HexColor("#58CC02"),
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);

                                              /*   scaffoldkey.currentState!.showSnackBar(
                                                    SnackBar(content: Text("invalid OTP")));*/
                                            }
                                          },
                                        ),
                                ),
                                FittedBox(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                          width: screenSize.width * 0.9,
                                          height: 40,
                                          child: Text("")),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
            Center(
              child: Visibility(
                visible: visible,
                child: Container(
                  height: 400,
                  width: 400,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrer votre mot de passe";
                          } else if (value.length < 8) {
                            return "Le mot de passe doit avoir au moins 8 caractères";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: password,
                        obscureText: passwordObscure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color:
                                  passwordObscure ? Colors.grey : Colors.green,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordObscure = !passwordObscure;
                              });
                            },
                          ),
                          labelText: "Mot de passe",
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
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
                            child: loading
                                ? Center(
                                    child: SpinKitWave(
                                      color: Colors.white,
                                      size: 25,
                                      controller: animationcontroller,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "Update",
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
                            onPressed: loading
                                ? () {}
                                : () async {
                                    await DBService().updatePassword(
                                      password.text,
                                    );
                                    Fluttertoast.showToast(
                                      msg: "Mot de Passe modifié",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 4,
                                      backgroundColor: HexColor("#58CC02"),
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                    setState(() {
                                      loading = !loading;
                                    });
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Menu(),
                                      ),
                                      (route) => false,
                                    );
                                    Future.delayed(Duration(seconds: 2), () {
                                      Welcome().showWelcome(context);
                                    });
                                  },
                            duration: const Duration(milliseconds: 160),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  verifyPhoneNumber() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+237${widget.telephone}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            //quand tout c'est bien passé
            Logger().d("on complete method");
            try {
              await FirebaseAuth.instance
                  .signInWithCredential(credential)
                  .then((value) async {
                if (value.user != null) {
                  Logger().d("user logged in");
                  print('save user');
                }
              });
            } catch (e) {
              Logger().d(e);
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            Logger().d(e.message);
            if (e.code == 'invalid-phone-number') {
              Logger().d('The provided phone number is not valid.');
              Fluttertoast.showToast(
                  msg: "Numéro de téléphone invalide",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 4,
                  backgroundColor: HexColor("#58CC02"),
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          codeSent: (String verificationID, int? resendToken) {
            if (mounted) {
              setState(() {
                verificationCode = verificationID;
              });
            }
          },
          codeAutoRetrievalTimeout: (String verificationID) {
            if (mounted) {
              setState(() {
                verificationCode = verificationID;
              });
            }
          },
          timeout: Duration(seconds: 60));
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Une erreur est survenue",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: HexColor("#58CC02"),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
