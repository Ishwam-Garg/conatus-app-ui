//to make this for non user
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conatus_app/components/conatus_post.dart';
import 'package:conatus_app/components/custom_appbar.dart';
import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/config.dart';
import 'package:conatus_app/constants/units.dart';
import 'package:conatus_app/views/home_pages/attendance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conatus_app/constants/color_palatte.dart';

class Non_user_homepage extends StatefulWidget {
  @override
  _Non_user_homepageState createState() => _Non_user_homepageState();
}

class _Non_user_homepageState extends State<Non_user_homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: 'DashBoard'),
      backgroundColor: ColorPalette.PRIMARY_BG,
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Column(
              children: <Widget>[
              SizedBox(height: 10),
              /*Backend Linked Starts Here
              // ConatusPost(),
              // StreamBuilder(
              //   stream: FirebaseFirestore.instance.collection(Config.POSTS).snapshots(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return ListView.builder(
              //           shrinkWrap: true,
              //           physics: NeverScrollableScrollPhysics(),
              //           itemCount: snapshot.data.documents.length,
              //           itemBuilder: (context, index) {
              //             DocumentSnapshot mypost = snapshot.data.documents[index];
              //             String title = mypost.get(Config.POST_TITLE);
              //             String message = mypost.get(Config.POST_MESSAGE);
              //             String issueDate = mypost.get(Config.POST_DATE);
              //             return ConatusPost(
              //               title: title,
              //               message: message,
              //               issueDate: issueDate,
              //             );
              //           });
              //     } else {
              //       return Text(
              //         'No Posts yet',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: Unit.FONT_LARGE,
              //         ),
              //       );
              //     }
              //   },
              // ),
               */
              ConatusPost(
                title: 'title',
                message: 'message',
                issueDate: 'issueDate',
                ),
            ],
          ),
        ],
        ),
      ),
      ),
    );
  }
}






