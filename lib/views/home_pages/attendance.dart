import 'package:conatus_app/components/attendance_sliverbar.dart';
import 'package:conatus_app/components/custom_divider.dart';
import 'package:conatus_app/components/marked_attendance.dart';
import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/units.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool isPresent;

  Widget markAtt() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(Unit.V_MARGIN),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorPalette.BLUE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Mark Your Attendance',
                style: TextStyle(fontSize: Unit.FONT_LARGE, color: Colors.white),
              ),
              Text(
                '14.09.2020',
                style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            '6.00 - 6.30 PM',
            style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPresent = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.greenAccent,
                  ),
                  child: Text(
                    'PRESENT',
                    style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPresent = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.redAccent[100],
                  ),
                  child: Text(
                    'ABSENT',
                    style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.PRIMARY_BG,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          AttendanceSliverBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: ColorPalette.PRIMARY_BG,
                  padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      isPresent == null ? markAtt() : SizedBox(),
                      SizedBox(height: 10),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: CustomDivider.zeroPaddingDivider()),
                      SizedBox(height: 10),
                      isPresent != null
                          ? MarkedAttendance(
                              isPresent: isPresent,
                            )
                          : SizedBox(),
                      MarkedAttendance(isPresent: true),
                      MarkedAttendance(isPresent: true),
                      MarkedAttendance(isPresent: false),
                      MarkedAttendance(isPresent: true),
                      MarkedAttendance(isPresent: true),
                      MarkedAttendance(isPresent: true),
                      MarkedAttendance(isPresent: false),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
