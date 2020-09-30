import 'package:conatus_app/components/custom_appbar.dart';
import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/units.dart';
import 'package:conatus_app/components/doubt_box_readonly.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'doubt_form.dart';

class FAQsPage extends StatefulWidget {
  @override
  _FAQsPageState createState() => _FAQsPageState();
}

class _FAQsPageState extends State<FAQsPage> {
  @override
  void initState() {
    super.initState();
    // check if user is logged in then can add comment
  }

  Widget doubtBox() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: Unit.V_MARGIN, horizontal: Unit.H_MARGIN),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black54,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DoubtBoxReadOnly(),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        title: "FAQs and Doubts",
      ),
      backgroundColor: ColorPalette.PRIMARY_BG,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (_) => DoubtForm()));
        },
        child: Icon(
          Icons.add,
          color: ColorPalette.SELECTED_NAV_BAR,
        ),
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
              for (int i = 0; i < 10; i++) doubtBox(),
            ],
          ),
        ),
      ),
    );
  }
}
