import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conatus_app/components/conatus_post.dart';
import 'package:conatus_app/components/custom_appbar.dart';
import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/config.dart';
import 'package:conatus_app/constants/units.dart';
import 'package:conatus_app/views/home_pages/attendance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/color_palatte.dart';
import 'home_page_drawer_user.dart';
import 'package:conatus_app/views/doubt pages/doubt_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //attendance box at first
  Widget attendanceBox() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(Unit.V_MARGIN),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black54,
        ),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 7),
                  height: 20,
                  width: 3,
                  color: ColorPalette.BLUE,
                ),
                Text(
                  'CONATUS\' ATTENDANCE',
                  style: TextStyle(fontSize: Unit.FONT_LARGE,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Attendance ',
                  style: TextStyle(
                      fontSize: Unit.FONT_SMALL, color: Colors.white),
                ),
                Text(
                  ' 13/15',
                  style: TextStyle(fontSize: Unit.FONT_MEDIUM,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => Attendance()));
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: ColorPalette.YELLOW,
                  ),
                  child: Text(
                    'SHOW',
                    style: TextStyle(fontSize: Unit.FONT_MEDIUM,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  // PASS A NAME AS PARAMETER IN IT
  Widget birthdayBox() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(Unit.V_MARGIN),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black54,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   child: Row(
                     children: [
                       Icon(Icons.cake,color: ColorPalette.YELLOW,),
                       SizedBox(width: 2,),
                       Text(
                         'Happy Birthday',
                         style: TextStyle(fontSize: Unit.FONT_LARGE,
                             color: Colors.white,
                             fontWeight: FontWeight.bold),
                       ),
                     ],),),
               ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10,),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorPalette.BLUE,
                        // backgroundImage: NetworkImage(photo),
                      ),
                      Text("Name",style: TextStyle(color: ColorPalette.UNSELECTED_NAV_BAR),),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 5,
                        height: 80,
                        color: ColorPalette.YELLOW,
                      ),
                      SizedBox(width: 5,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Text("\"Conatus wishes you a \n a very happy birthday \n may you achieve \n all your goals in future\"",style: TextStyle(fontSize: Unit.FONT_SMALL,color: Colors.white),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
              ],
            ),
            /*
            GestureDetector(
              onTap: () {
                /*
                Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => Attendance()));
                */
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: ColorPalette.YELLOW,
                  ),
                  child: Text(
                    'SHOW',
                    style: TextStyle(fontSize: Unit.FONT_MEDIUM,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),*/
          ],
        ));
  }

  //main body starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: 'Home',),
      drawer: UserDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat,color: ColorPalette.SELECTED_NAV_BAR,),
        backgroundColor: ColorPalette.PRIMARY_DARK,
        onPressed: (){
          //add post page here
          Navigator.push(
              context, CupertinoPageRoute(builder: (_) => doubt_page()));
        },
        elevation: 5,
      ),
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
                  birthdayBox(),
                  SizedBox(height: 10),
                  attendanceBox(),
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
