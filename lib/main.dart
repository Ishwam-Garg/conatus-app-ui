// flutter_form_builder 
// ui attendance

import 'package:conatus_app/auth/login_page.dart';
import 'package:conatus_app/views/root_loggedin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:conatus_app/Non-User-Pages/Non-User-homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        // home: RootPage());
        //home: LoginPage());
        home: Non_user_homepage());
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool isLoggedin;

  @override
  void initState() {
    super.initState();
    User user = FirebaseAuth.instance.currentUser;
    isLoggedin = user == null ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedin ? RootLoggedIn() : LoginPage();
  }
}
