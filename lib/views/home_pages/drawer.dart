import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/units.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conatus_app/components/custom_divider.dart';
import 'package:conatus_app/views/profile_pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:conatus_app/views/root_loggedout_page.dart';

class UserDrawer {
  static Widget userProfile({context}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
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
              SizedBox(height: 10),
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
                    Navigator.pop(context);
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => ProfilePage()));
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

  static Widget buttons({String title, String sideText, Function func, context}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
          ),
          GestureDetector(
            onTap: func,
            child: Text(
              sideText,
              style: TextStyle(fontSize: Unit.FONT_SMALL, color: ColorPalette.GREEN),
            ),
          ),
        ],
      ),
    );
  }

  static Widget homeDrawer(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Container(
        color: ColorPalette.PRIMARY_BG,
        child: Column(
          children: [
            SizedBox(height: 40),
            userProfile(context: context),
            CustomDivider.zeroPaddingDividerGrey(),
            buttons(
              title: 'Help',
              sideText: 'view',
              context: context,
              func: () {},
            ),
            CustomDivider.zeroPaddingDividerGrey(),
            buttons(
              title: 'Settings',
              sideText: 'tweak here',
              context: context,
              func: () {},
            ),
            CustomDivider.zeroPaddingDividerGrey(),
            Spacer(),
            CustomDivider.zeroPaddingDividerGrey(),
            buttons(
              title: 'Log Out',
              sideText: 'here',
              context: context,
              func: () async {
                final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                try {
                  await _firebaseAuth.signOut();
                  Navigator.of(context, rootNavigator: true)
                      .pushReplacement(MaterialPageRoute(builder: (_) => RootLoggedOut()));
                } catch (e) {
                  print("Error in logging out $e");
                }
              },
            ),
            CustomDivider.zeroPaddingDividerGrey(),
          ],
        ),
      ),
    );
  }
}
