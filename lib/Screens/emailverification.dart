import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'dart:convert';
import 'package:pharma_net/Network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pharma_net/Screens/homepage.dart';

class emailverification extends StatefulWidget {
  static String id = "/emailverification";
  @override
  _emailverificationState createState() => _emailverificationState();
}

class _emailverificationState extends State<emailverification> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
                      "Thank you for trusting us",
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
                            height: 50,
                            width: 50,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              controller: c1,
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              controller: c2,
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              controller: c3,
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              controller: c4,
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              controller: c5,
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            color: Color(0xFFC2D5FF).withOpacity(0.6),
                            child: TextField(
                              controller: c6,
                              decoration: InputDecoration(
                                hintText: "-",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 28,
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
                          _verify();
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

  void _verify() async {
    var data = {
      'c1': c1.text,
      'c2': c2.text,
      'c3': c3.text,
      'c4': c4.text,
      'c5': c5.text,
      'c6': c6.text
    };

    var res = await Network().auth(data, '/verify');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homepage()));
    } else {
      _showMsg(body['message']);
    }
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
