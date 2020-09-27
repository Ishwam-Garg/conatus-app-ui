import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/config.dart';
import 'package:conatus_app/constants/units.dart';
import 'package:conatus_app/views/root_loggedin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void gsignin() async {
    try {
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
    try {
      setState(() {
        isLoading = true;
      });
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      final User user = (await _firebaseAuth.signInWithCredential(credential)).user;
      // print(user.displayName);
      // print("logged in");

      bool isRegistered = await checkExist(user.uid);
      if (isRegistered) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RootLoggedIn()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Register()));
      }
    } catch (e) {
      print(e);
      // print("cant logggin");
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<bool> checkExist(String docID) async {
    bool exists = false;
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection(Config.USER_COLLECTION).doc(docID).get();
    exists = ds.exists;
    return exists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.PRIMARY_BG,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0, -0.50),
              child: Container(
                child: Text(
                  'CONATUS',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.65),
              child: GestureDetector(
                // onTap: gsignin,
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RootLoggedIn()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: ColorPalette.BLUE,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Login with Google',
                    style: TextStyle(color: Colors.white, fontSize: Unit.FONT_LARGE),
                  ),
                ),
              ),
            ),
            isLoading
                ? Container(
                    constraints: BoxConstraints.expand(),
                    color: ColorPalette.PRIMARY_BG,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        backgroundColor: ColorPalette.PRIMARY_BG,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
