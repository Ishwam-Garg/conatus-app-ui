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

class doubt_page extends StatefulWidget {
  @override
  _doubt_pageState createState() => _doubt_pageState();
}

class _doubt_pageState extends State<doubt_page> {
  //pass title, short description, and name of questinee to this widget
  Widget DoubtBox() {
    return GestureDetector(
      onTap: (){},
      child: Container(
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
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(height: 15,color: ColorPalette.BLUE_NORMAL,width: 5,),
                        SizedBox(width: 5,),
                        Text("Title:",style: TextStyle(fontSize: Unit.FONT_LARGE,color: Colors.white),),
                        SizedBox(width: 5,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text('How to add floating btn',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: Unit.FONT_MEDIUM,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],),),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                  SizedBox(width: 15,),
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
                            SingleChildScrollView(
                              child: Container(
                                height: 100,
                                child: Text("\"I am facing problem \n while using floating button \n and dont know how \n to solve it\"",style: TextStyle(fontSize: Unit.FONT_SMALL,color: Colors.white),),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
          )),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: "Doubts",),
      backgroundColor: ColorPalette.PRIMARY_BG,
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add,color: ColorPalette.SELECTED_NAV_BAR,),
          backgroundColor: ColorPalette.PRIMARY_DARK,
      elevation: 5,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(Unit.V_MARGIN),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54,
                ),
                child: Row(
                  children: [
                    Container(height: 20,color: ColorPalette.BLUE_NORMAL,width: 5,),
                    SizedBox(width: 10,),
                    Text("Doubts Here",style: TextStyle(fontSize: Unit.FONT_LARGE,color: Colors.white),),
                  ],
                ),
              ),
              DoubtBox(),
            ],
          ),
        ),
      ),
    );
  }
}
