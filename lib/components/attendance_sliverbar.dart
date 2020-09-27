import 'package:conatus_app/constants/color_palatte.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AttendanceSliverBar extends StatefulWidget {
  @override
  _AttendanceSliverBarState createState() => _AttendanceSliverBarState();
}

class _AttendanceSliverBarState extends State<AttendanceSliverBar> {
  double sliverHeight = 220;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorPalette.PRIMARY_BG,
      pinned: true,
      expandedHeight: sliverHeight,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
              constraints: BoxConstraints.expand(),
              child: CircularPercentIndicator(
                radius: sliverHeight * 0.5,
                lineWidth: 15,
                backgroundColor: ColorPalette.PRIMARY_BG,
                animation: true,
                startAngle: 0.0,
                animationDuration: Duration.millisecondsPerSecond,
                percent: 0.8,
                progressColor: ColorPalette.BLUE,
                center: FittedBox(
                  child: Text(
                    "75%",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
          centerTitle: true,
          title: Text('ATTENDANCE')),
    );
  }
}
