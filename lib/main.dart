import 'package:flutter/material.dart';
import 'package:lasylab_mobile_app/models/user.dart';
import 'package:lasylab_mobile_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp(initialRoute: "/"));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({this.initialRoute = "/"});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: getRoutes(), // initialRoute,
      routes: routes,
    );
  }
}

String getRoutes() {
  final box = GetStorage();
  bool onboarding = box.read("onboarding") ?? false;

  Usermodel? user = DBService().getLocalUser();

  if (onboarding) {
    if (user != null) {
      return "/menu";
    } else {
      return "/login";
    }
  } else {
    return "/";
  }
}
