import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/config.dart';
import 'package:conatus_app/constants/units.dart';
import 'package:conatus_app/views/home_pages/attendance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../auth/login_page.dart';
import '../../components/custom_divider.dart';
import '../../constants/color_palatte.dart';
import 'package:conatus_app/auth/login_page.dart';
import 'package:conatus_app/components/custom_divider.dart';
import 'package:conatus_app/views/profile_pages/profile_page.dart';


class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {

  Widget Drawer_Profile()
    {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 20,),
                Text(
                  'Name',
                  style: TextStyle(color: Colors.white, fontSize: Unit.FONT_LARGER),
                ),
                Text(
                  'bio',
                  style: TextStyle(color: Colors.grey, fontSize: Unit.FONT_MEDIUM),
                ),
                Text(
                  "section, year",
                  style: TextStyle(color: Colors.grey, fontSize: Unit.FONT_MEDIUM),
                ),
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    // backgroundImage: NetworkImage(photo),
                    backgroundColor: ColorPalette.BLUE,
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      //Change this to navigate to profile page.dart
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (_) => ProfilePage()));
                    },
                    child: Text(
                      'See More',
                      style: TextStyle(color: ColorPalette.GREEN, fontSize: Unit.FONT_MEDIUM),
                    ),
                  ),
                ]),
          ],
        ),
      );
    }

  Widget logoutContainer_drawer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Log Out',
            style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
          ),
          GestureDetector(
            onTap: () async {
              // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
              try {
                // await _firebaseAuth.signOut();
                Navigator.of(context, rootNavigator: true)
                    .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
              } catch (e) {
                print("Error in logging out $e");
              }
            },
            child: Text(
              'LOGOUT',
              style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
            ),
          ),
        ],
      ),
    );
  }

  Widget settings_drawer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Settings',
            style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
          ),
          GestureDetector(
            onTap: () async {
              // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
              //settings page here
              /*
              try {
                // await _firebaseAuth.signOut();
                Navigator.of(context, rootNavigator: true)
                    .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
              } catch (e) {
                print("Error in logging out $e");
              }
              */
            },
            child: Row(
              children: [
                //Icon(Icons.settings,color: ColorPalette.GREEN,),
                Text(
                  'SETTINGS',
                  style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget help_drawer() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Help',
            style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
          ),
          GestureDetector(
            onTap: () async {
              // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
              /* Add help page here
              try {
                // await _firebaseAuth.signOut();
                Navigator.of(context, rootNavigator: true)
                    .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
              } catch (e) {
                print("Error in logging out $e");
              }
               */

            },
            child: Row(
              children: [
                Text(
                  'HELP',
                  style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Container(
        color: ColorPalette.PRIMARY_BG,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Drawer_Profile(),
            SizedBox(height: 20,),
            CustomDivider.zeroPaddingDividerGrey(),
            logoutContainer_drawer(),
            CustomDivider.zeroPaddingDividerGrey(),
            SizedBox(height: 20,),
            help_drawer(),
            CustomDivider.zeroPaddingDividerGrey(),
            SizedBox(height: 20,),
            settings_drawer(),
            CustomDivider.zeroPaddingDividerGrey(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
