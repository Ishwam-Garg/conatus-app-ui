import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conatus_app/components/custom_appbar.dart';
import 'package:conatus_app/constants/color_palatte.dart';
import 'package:conatus_app/constants/config.dart';
import 'package:conatus_app/constants/units.dart';
import 'package:flutter/material.dart';

class ReportForm extends StatefulWidget {
  final name;
  final email;
  final uid;
  ReportForm({@required this.name, @required this.email, @required this.uid});
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  String reason;

  Widget headerText(title) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: Unit.FONT_LARGER, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget sendButton() {
    return GestureDetector(
      onTap: () async {
        if (reason != null && reason.isNotEmpty) {
          // final CollectionReference dataCollection = FirebaseFirestore.instance.collection(Config.REPORT_COLLECTION);
          // await dataCollection.doc().set({
          //   Config.NAME: widget.name,
          //   Config.MAIL: widget.email,
          //   Config.UID: widget.uid,
          //   Config.REASON: reason,
          // });
          Navigator.pop(context);
        } else {
          print("wrong data");
        }
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Send',
          style: TextStyle(fontSize: Unit.FONT_LARGER, color: ColorPalette.BLUE, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget textInput({String initialValue, Function change, String hintText, bool readOnly, bool isMultiLine}) {
    return Theme(
      data: new ThemeData(
        primaryColor: Colors.grey,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        enabled: !readOnly,
        maxLength: isMultiLine ? 1000 : 200,
        minLines: 1,
        maxLines: isMultiLine ? 5 : 1,
        style: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.white),
        keyboardType: TextInputType.text,
        initialValue: initialValue,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: -15),
          counterText: "",
          hintText: hintText,
          hintStyle: TextStyle(fontSize: Unit.FONT_MEDIUM, color: Colors.grey),
        ),
        onChanged: change,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar.editAppBar(context: context, title: 'Reprot/Submit Query'),
        backgroundColor: ColorPalette.PRIMARY_BG,
        body: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.symmetric(horizontal: Unit.H_MARGIN),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: Unit.V_MARGIN),
                headerText('Name'),
                textInput(
                  initialValue: widget.name,
                  change: (val) {},
                  hintText: 'Your Name',
                  readOnly: true,
                  isMultiLine: false,
                ),
                SizedBox(height: 20),
                headerText('Your Email'),
                textInput(
                  initialValue: widget.email,
                  change: (val) {},
                  hintText: 'Your Email',
                  readOnly: true,
                  isMultiLine: false,
                ),
                SizedBox(height: 20),
                headerText('Query Brief'),
                textInput(
                  change: (val) {
                    setState(() {
                      reason = val;
                    });
                  },
                  hintText: 'Explain your problem/query here',
                  readOnly: false,
                  isMultiLine: true,
                ),
                SizedBox(height: 30),
                sendButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
