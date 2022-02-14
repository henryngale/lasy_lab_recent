import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:intl/intl.dart';
import 'package:lasylab_mobile_app/services/auth_service.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';
import 'package:lasylab_mobile_app/views/otpscreen.dart';
import 'package:logger/logger.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  bool isChecked = false;
  late TextEditingController name;
  late TextEditingController surName;
  late TextEditingController phone;
  late TextEditingController school;
  late TextEditingController password;
  late TextEditingController birthdate;
  bool isloading = false;
  bool passwordObscure = false;

  AnimationController? animationcontroller;
  late List<TextEditingController> fields;
  final formGlobalKey = GlobalKey<FormState>();
  AuthService auth = AuthService();
  List<String> classeitems = [
    /*  "SIL",
    "CP",
    "CE1",
    "CE2",
    "CM1",
    "CM2",*/
    "6e",
    "5e",
    "4e",
    "3e",
    "2nde",
    "1ère",
    "Tle"
  ];
  String selectedclassitem = "";

  List<String> schoolitems = [
    "C. S. AMASIA",
    "C. S. DE LA CITE",
    "C.E.T.G.U YAOUNDE",
    "C.S. ADVENTISTE",
    "C.S. AMIS DU PROGRES",
    "C.S. COMPL. MODERN. ESSOS",
    "C.S. DE L'ETHIQUE",
    "C.S. DE L'UNITE",
    "C.S. INSTITUT SIANTOU",
    "C.S. INSTITUT STAR YAOUNDE",
    "C.S. LA MATURITE",
    "C.S. LA PERSEVERANCE YAOUNDE",
    "C.S. LA RIGUEUR",
    "C.S. LA ROSIERE YAOUNDE",
    "C.S. LE PROGRES SOCIAL",
    "C.S. MARIE PERPETUEL SECOURS",
    "C.S. MATAMFEN",
    "C.S. NOTRE DAME DU ROSAIRE",
    "C.S. TELE AFRICA SCHOOL",
    "C.S. UNIVERSITAIRE NOVA VETERA",
    "CAMEROON SCHOOL OF EXCELLENCE",
    "CENTRE EDUCATIF EKOUDOU BASTOS",
    "CENTRE EDUCATIF MEYONG MEYEME",
    "CENTRE MERICI FRASSATI",
    "CETI JEANNE ALEGUE",
    "CETI SACRE COEUR MOKOLO",
    "CETIF BENIGNA ETOUDI",
    "CITY BILINGUAL ACADEMY",
    "COLLEGE ADVENTISTE YAOUNDE",
    "COLLEGE BILINGUE JEUNESSE LUMIERE",
    "COLLEGE BILINGUE KIATABALA",
    "COLLEGE CATHOLIQUE PERE MONTI",
    "COLLEGE DE LA MEFOU",
    "COLLEGE DE LA RENOVATION",
    "COLLEGE DE LA RETRAITE",
    "COLLEGE EBANDA",
    "COLLEGE FLEMING",
    "COLLEGE I.T.S.E",
    "COLLEGE JEAN TABI",
    "COLLEGE MADELEINE",
    "COLLEGE MARIE ALBERT II",
    "COLLEGE MONGO BETI",
    "COLLEGE P. L. MVOM-NNAM",
    "COLLEGE P. LAÏC EXCELLENCE PLUS",
    "COLLEGE PRIVE ATANGANA ESSOMBA",
    "COLLEGE PRIVE DE L'ESPERANCE",
    "COLLEGE PRIVE DU SAVOIR",
    "COLLEGE PRIVE LA GAITE",
    "COLLEGE PRIVE LAIC CHARLES MBAKOP",
    "COLLEGE PRIVE LAIC DU MONT VALERIEN",
    "COLLEGE PRIVE LAIC FAPO",
    "COLLEGE PRIVE LAIC LAROUSSE",
    "COLLEGE PRIVE LAIC LES PHARAONS",
    "COLLEGE PRIVE LAIC NOTRE DAME DES BEATITUDES",
    "COLLEGE PRIVE LAÏC DJA'ANKEU",
    "COLLEGE PRIVE LAÏC EFFA GASTON",
    "COLLEGE PRIVE LAÏC LES SAPINS",
    "COLLEGE PRIVE LAÏC SIGMUND FREUD",
    "COLLEGE PRIVE LES BAMBIS",
    "COLLEGE PRIVE LES LILAS",
    "COLLEGE PRIVE MONTESQUIEU",
    "COLLEGE PROTESTANT JOHNSTON",
    "COLLEGE SHAKESPEARE",
    "COLLEGE TOUSSAINT ANTOINE",
    "COLLEGE VOGT",
    "COMPLEXE SCOLAIRE ADVENTISTE D'ODZA",
    "COMPLEXE SCOLAIRE SAINT-ANDRE",
    "COURS DU SOIR DESCARTES",
    "COURS DU SOIR PROMETHE",
    "ECOLE D'AFRIQUE",
    "I.S.D.I.G YAOUNDE",
    "INSTITUT BAUDELAIRE BILINGUE",
    "INSTITUT BELLA ASSAN",
    "INSTITUT BILINGUE D'ETOUDI",
    "INSTITUT GASOLENT YAOUNDE",
    "INSTITUT JEAN BODY ZIBI",
    "INSTITUT MATAMFEN",
    "INSTITUT MBE",
    "INSTITUT POLYVALENT DE LA RENOVATION PEDAGOGIQUE",
    "INSTITUT POLYVALENT EXCELLENCE",
    "INSTITUT POLYVALENT NIBERT",
    "INSTITUT PRIVE LAÏC CENTRAL",
    "INSTITUT SAMBA",
    "INSTITUT SIANTOU",
    "INSTITUT TANA AHANDA",
    "INSTITUT TECHN. INDUS. ETOUG EBE",
    "INSTITUT VICTOR HUGO YAOUNDE",
    "IRG",
    "ISEIG YAOUNDE",
    "LYCEE BILINGUE D'APPLICATION YAOUNDE",
    "LYCEE BILINGUE D'ESSOS",
    "LYCEE BILINGUE D'ETOUG-EBE",
    "LYCEE D'ANGUISSA",
    "LYCEE D'EKOUNOU",
    "LYCEE D'ELIG-ESSONO",
    "LYCEE D'EMANA",
    "LYCEE DE BIYEM ASSI",
    "LYCEE DE LA CITE VERTE",
    "LYCEE DE MBALLA II",
    "LYCEE DE MENDONG",
    "LYCEE DE MIMBOMAN",
    "LYCEE DE NKOL-ETON",
    "LYCEE DE NKOLBISSON",
    "LYCEE DE NKOLNDONGO",
    "LYCEE DE NSAM EFOULAN",
    "LYCEE DE TSINGA",
    "LYCEE FRANCAIS Fustel de Coulanges",
    "LYCEE GENERAL LECLERC",
    "LYCEE NGOUSSO-NGOULMEKONG",
    "LYCEE TECHNIQUE D'EKOUNOU",
    "LYCEE TECHNIQUE DE NKOLBISSON",
    "LYCEE TECHNIQUE DE YAOUNDE",
    "Lycée Fustel de Coulanges",
    "NOTRE DAME DE VICTOIRE",
    "SEMINAIRE STE THERESE DE MVOLYE",
    "Autre"
  ];
  String selectedschoolitem = "";
  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    surName = TextEditingController();
    phone = TextEditingController();
    school = TextEditingController();
    password = TextEditingController();
    birthdate = TextEditingController();

    if (mounted) {
      setState(() {
        selectedschoolitem = schoolitems[0];
        selectedclassitem = classeitems[0];
      });
    }
    fields = [
      name,
      surName,
      phone,
      password,
      birthdate,
    ];

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
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return HexColor("#AFAFAF");
    }

    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FCF6F4"),
        body: Form(
          key: formGlobalKey,
          child: ListView(
            primary: true,
            children: [
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
                            "Crée ton compte",
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
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: screenSize.width * 0.44,
                                    height: 40,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Entrer votre nom";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      controller: name,
                                      decoration: InputDecoration(
                                        labelText: "Nom",
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
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: screenSize.width * 0.44,
                                    height: 40,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Entrer votre prénom";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      controller: surName,
                                      decoration: InputDecoration(
                                        labelText: "Prénom",
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
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: screenSize.width * 0.9,
                                height: 40,
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
                                  controller: phone,
                                  decoration: InputDecoration(
                                    labelText: "Téléphone",
                                    prefixText: '+237',
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
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
                        selectedschoolitem == "Autre"
                            ? FittedBox(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: screenSize.width * 0.9,
                                      height: 40,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Entrer votre école";
                                          } else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        controller: school,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: "Ecole",
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
                              )
                            : FittedBox(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: screenSize.width * 0.9,
                                      height: 40,
                                      child: Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              color: Colors.grey,
                                            )),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                              value: selectedschoolitem,
                                              isExpanded: true,
                                              items: schoolitems
                                                  .map((e) => DropdownMenuItem(
                                                      child: Text(
                                                        e,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      value: e))
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedschoolitem = value!;
                                                  fields = selectedschoolitem !=
                                                          "Autre"
                                                      ? [
                                                          name,
                                                          surName,
                                                          phone,
                                                          password,
                                                          birthdate,
                                                        ]
                                                      : [
                                                          name,
                                                          surName,
                                                          phone,
                                                          school,
                                                          password,
                                                          birthdate,
                                                        ];
                                                  Logger().d(fields.length);
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                        //ajout du champ pour renseigner la classe
                        FittedBox(
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: screenSize.width * 0.9,
                                    height: 40,
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Colors.grey,
                                          )),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                            isExpanded: true,
                                            value: selectedclassitem,
                                            items: classeitems
                                                .map((e) => DropdownMenuItem(
                                                    child: Text(e), value: e))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedclassitem = value!;
                                              });
                                            }),
                                      ),
                                    ),
                                  ))),
                        ),
                        FittedBox(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: screenSize.width * 0.9,
                                height: 40,
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
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((value) {
                              setState(() {
                                birthdate.text =
                                    "${DateFormat('yyyy-MM-dd').format(value!)}";
                              });
                            });
                          },
                          child: Container(
                            width: screenSize.width * 0.9,
                            height: 60,
                            color: Colors.transparent,
                            child: FittedBox(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: screenSize.width * 0.9,
                                    height: 40,
                                    child: IgnorePointer(
                                      child: TextFormField(
                                        enabled: true,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              birthdate.text.isEmpty) {
                                            return "Entrer votre date de naissance";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: birthdate,
                                        decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            onTap: () async {
                                              await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2010),
                                                lastDate: DateTime(2025),
                                              ).then((value) {
                                                setState(() {
                                                  birthdate.text =
                                                      "${DateFormat('yyyy-MM-dd').format(value!)}";
                                                });
                                              });
                                            },
                                            child: Icon(
                                              Icons.date_range,
                                              color: HexColor("#58CC02"),
                                            ),
                                          ),
                                          labelText: "Date de Naissance",
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
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "j’accepte de recevoir des conseils pédagogique et\ndes offres promotionnelles de lasyalab sms.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunito(
                                      color: Colors.black,
                                      textStyle: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        isFilled(
                                    isSelectedschoolitem:
                                        selectedschoolitem != "Autre") ==
                                true
                            ? Container(
                                color: Colors.white,
                                margin: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 15,
                                  bottom: 30,
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
                                              "Terminer",
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
                                              //loader
                                              /*       bool register =await auth.signup(email, password);
                                            if(register){
                                              Navigator.of(context)
                                            .pushNamed("/welcome_fees");
                                            }*/
                                              try {
                                                setState(() {
                                                  isloading = true;
                                                });
                                                bool result = await DBService()
                                                    .verifyIfPhoneExist(
                                                        phone.text);
                                                setState(() {
                                                  isloading = false;
                                                });
                                                Logger().d("result " +
                                                    result.toString());
                                                if (result) {
                                                  Fluttertoast.showToast(
                                                    msg:
                                                        "Ce numéro de téléphone existe déjà",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 4,
                                                    backgroundColor:
                                                        HexColor("#58CC02"),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0,
                                                  );
                                                } else {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OTPScreen(
                                                        nom: name.text,
                                                        prenom: surName.text,
                                                        telephone: phone.text,
                                                        ecole: selectedschoolitem ==
                                                                "Autre"
                                                            ? school.text
                                                            : selectedschoolitem,
                                                        classe:
                                                            selectedclassitem,
                                                        password: password.text,
                                                        birthdate:
                                                            birthdate.text,
                                                      ),
                                                    ),
                                                  );
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
                                                    gravity:
                                                        ToastGravity.BOTTOM,
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
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "En cliquant sur Terminer, vous acceptez les\nconditions générales d’utilisation et la politique de\nconfidentialité de lasylab",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
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
                                  text: 'Connecte-toi!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pushNamed("/login");
                                    }),
                            ],
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
      ),
    );
  }

  bool isFilled({bool isSelectedschoolitem = false}) {
    int check = 0;
    for (var field in fields) {
      if (field.text != "") check++;
    }
    return !isSelectedschoolitem ? check == 6 : check == 5;
  }
}
