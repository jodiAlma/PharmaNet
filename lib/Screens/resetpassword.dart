import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';

class resetpassword extends StatelessWidget {
  static String id = "resetpassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 5),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, Queries.ScreenHeight(context) / 16, 0, 0),
                    child: Text(
                      "Enter the new password",
                      style: TextStyle(
                          fontSize: 28,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Cardo',
                          color: Color(0xFF4C88DE)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Text(
                        "Please choose a strong password",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontFamily: 'Cardo',
                            color: Color(0xFFFFB349)),
                      )),
                  Center(
                      child: Column(children: [
                    SizedBox(height: 20),
                    Container(
                      width: Queries.ScreenWidth(context) / 1.2,
                      height: 50,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Color(0xFFC2D5FF).withOpacity(0.6),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "New Password",
                            prefixIcon: Icon(Icons.lock),
                            border: InputBorder.none),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FlatButton(
                        minWidth: 175,
                        height: 50,
                        onPressed: () {},
                        color: Color(0xFFC2D5FF).withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)),
                        child: Text("Submit", style: TextStyle(fontSize: 24))),
                  ])),
                  SizedBox(height: 75),
                  Container(
                      child:
                          Image(image: AssetImage("images/resetpassword.png")))
                ]))));
  }
}
