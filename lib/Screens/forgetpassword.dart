import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'resetpassword.dart';

class forgetpassword extends StatelessWidget {
  static String id = "/forgetpassword";
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
                      "Resseting your password",
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
                        "Please enter the verification code sent to the provided email address",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontFamily: 'Cardo',
                            color: Color(0xFFFFB349)),
                      )),
                  Center(
                      child: Column(children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 75,
                            width: 75,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 36,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                            )),
                        Container(
                            height: 75,
                            width: 75,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 36,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                            )),
                        Container(
                            height: 75,
                            width: 75,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 36,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                            )),
                        Container(
                            height: 75,
                            width: 75,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 36,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                        minWidth: 250,
                        height: 75,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => resetpassword()));
                        },
                        color: Color(0xFFC2D5FF).withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        child: Text("Submit", style: TextStyle(fontSize: 34))),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                        height: 300,
                        child:
                            Image(image: AssetImage("images/verification.png")))
                  ]))
                ]))));
  }
}
