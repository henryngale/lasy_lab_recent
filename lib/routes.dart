import 'package:flutter/cupertino.dart';
import 'package:lasylab_mobile_app/views/account_choice.dart';
import 'package:lasylab_mobile_app/views/activities.dart';
import 'package:lasylab_mobile_app/views/chat_background.dart';
import 'package:lasylab_mobile_app/views/chat_page.dart';
import 'package:lasylab_mobile_app/views/classes_choice.dart';
import 'package:lasylab_mobile_app/views/congratulation.dart';
import 'package:lasylab_mobile_app/views/course_reader.dart';
import 'package:lasylab_mobile_app/views/course_status_reader.dart';
import 'package:lasylab_mobile_app/views/discussion_page.dart';
import 'package:lasylab_mobile_app/views/fees_formula.dart';
import 'package:lasylab_mobile_app/views/fees_welcome.dart';
import 'package:lasylab_mobile_app/views/home.dart';
import 'package:lasylab_mobile_app/views/login.dart';
import 'package:lasylab_mobile_app/views/menu.dart';
import 'package:lasylab_mobile_app/views/method_sheet.dart';
import 'package:lasylab_mobile_app/views/onboarding_screen.dart';
import 'package:lasylab_mobile_app/views/otpscreen.dart';
import 'package:lasylab_mobile_app/views/pre_inscription.dart';
import 'package:lasylab_mobile_app/views/profil.dart';
import 'package:lasylab_mobile_app/views/quiz_answer.dart';
import 'package:lasylab_mobile_app/views/quiz_launcher.dart';
import 'package:lasylab_mobile_app/views/quiz_sheet.dart';
import 'package:lasylab_mobile_app/views/register.dart';
import 'package:lasylab_mobile_app/views/research_page.dart';
import 'package:lasylab_mobile_app/views/reset_screen.dart';
import 'package:lasylab_mobile_app/views/revision_sheet.dart';

final routes = {
  "/": (BuildContext context) => OnboardingScreen(),
  "/login": (BuildContext context) => LoginPage(),
  "/register": (BuildContext context) => RegisterPage(),
  "/congratulations": (BuildContext context) => Congratulations(),
  "/account_choice": (BuildContext context) => AccountChoicePage(),
  "/classes_choice": (BuildContext context) => ClassesChoice(),
  "/welcome_fees": (BuildContext context) => WelcomeFees(),
  "/fees_formula": (BuildContext context) => FeesFormula(),
  "/menu": (BuildContext context) => Menu(),
  "/home": (BuildContext context) => HomePage(),
  "/activities": (BuildContext context) => ActivitiesPage(),
  "/revisions": (BuildContext context) => RevisionSheet(),
  "/method": (BuildContext context) => MethodSheet(),
  "/quiz": (BuildContext context) => QuizSheet(),
  "/chat": (BuildContext context) => ChatPage(),
  "/discussions": (BuildContext context) => DiscussionPage(),
  "/profil": (BuildContext context) => ProfilPage(),
  "/course_status": (BuildContext context) => CourseStatusReader(),
  "/course_reader": (BuildContext context) => CourseReader(),
  "/quiz_launcher": (BuildContext context) => QuizLauncher(),
  "/quiz_answer": (BuildContext context) => QuizAnswer(),
  "/chat_background": (BuildContext context) => ChatBackground(),
  "/research": (BuildContext context) => ResearchPage(),
  "/preinscription": (BuildContext context) => PreInscription(),
  "otpscreen": (BuildContext context) => OTPScreen(),
  "/reset": (BuildContext context) => ResetScreen(),
};
