import 'package:flutter/material.dart';
import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/units.dart';

class DoubtBoxReadOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 25,
              color: ColorPalette.BLUE_NORMAL,
              width: 5,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'How to add floating button in scaffold How to ld',
                style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Manish Kumarr',
            style: TextStyle(fontSize: Unit.FONT_SMALL, color: Colors.white70, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20,
              color: ColorPalette.YELLOW,
              width: 5,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'I am facing problem while using floating button and dont know how to solve it',
                style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    ));
  }
}
