import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/models/user.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lasylab_mobile_app/views/reset_screen.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late TextEditingController telephone;
  late TextEditingController password;
  final formGlobalKey = GlobalKey<FormState>();
  //bool firstime = true;
  bool isloading = false;
  bool passwordObscure = false;
  AnimationController? animationcontroller;
  @override
  void initState() {
    super.initState();
    telephone = TextEditingController();
    password = TextEditingController();
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
              children: [
                // TextButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, "/menu");
                //     },
                //     child: Text("test")),
                SizedBox(
                  height: screenSize.height * 0.88,
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
                                "Connecte-toi",
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
                            FittedBox(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
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
                                            color: passwordObscure
                                                ? Colors.grey
                                                : Colors.green,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              passwordObscure =
                                                  !passwordObscure;
                                            });
                                          },
                                        ),
                                        labelText: "Mot de passe",
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResetScreen(),
                                    ),
                                  );
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Mot de passe oublié ? 😥",
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
                                            "Je me connecte",
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
                                              if (FirebaseAuth
                                                      .instance.currentUser !=
                                                  null) {
                                                Logger().d(FirebaseAuth
                                                    .instance.currentUser);
                                                Usermodel? user =
                                                    await DBService().getUser(
                                                        FirebaseAuth.instance
                                                            .currentUser!.uid);
                                                Logger().d(user!.toJson());
                                                setState(() {
                                                  isloading = false;
                                                });
                                                if (user.password ==
                                                        password.text &&
                                                    user.telephone ==
                                                        telephone.text) {
                                                  Navigator.of(context)
                                                      .pushNamedAndRemoveUntil(
                                                    "/menu",
                                                    (route) => false,
                                                  );
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Connecté avec succès",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 4,
                                                      backgroundColor:
                                                          HexColor("#58CC02"),
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Téléphone ou Mot de passe incorrect",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 4,
                                                      backgroundColor:
                                                          HexColor("#58CC02"),
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              } else {
                                                Logger()
                                                    .d("Login with Firestore");
                                                Usermodel? user =
                                                    await DBService()
                                                        .loginWithFirestore(
                                                            telephone.text,
                                                            password.text);

                                                if (user != null) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Connecté avec succès",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 4,
                                                      backgroundColor:
                                                          HexColor("#58CC02"),
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);

                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          "/account_choice");
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Téléphone ou Mot de passe incorrect",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 4,
                                                      backgroundColor:
                                                          HexColor("#58CC02"),
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }

                                                setState(() {
                                                  isloading = false;
                                                });
                                              }
                                            } catch (e) {
                                              Logger().d(e);
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
                                                  fontSize: 16.0);
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
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        text: 'Tu as déjà un compte ? ',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'inscris-toi ici !',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed("/register");
                              },
                          ),
                        ],
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
