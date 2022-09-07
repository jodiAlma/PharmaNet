import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'package:pharma_net/Screens/pharmahomepage.dart';

import '../Network/api.dart';

class pharmamanage extends StatefulWidget {
  static String id = '/pharmamanage';

  @override
  _pharmamanageState createState() => _pharmamanageState();
}

class _pharmamanageState extends State<pharmamanage> {
  static bool onoff = false;
  String Type = "";
  TextEditingController active = TextEditingController();
  //TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFC2D5FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFC2D5FF),
        title: Row(
          children: [
            Expanded(
                child: FlatButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pharmahomepage()));
                    },
                    icon: Icon(Icons.dashboard, color: Colors.white),
                    label: Text(
                      "DashBoard",
                      style: TextStyle(
                        color: Color(0XFF5087A0),
                      ),
                    ))),
            Expanded(
                child: FlatButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pharmamanage()));
                    },
                    icon: Icon(Icons.sort, color: Colors.white),
                    label: Text(
                      "Manage",
                      style: TextStyle(
                        color: Color(0XFF5087A0),
                      ),
                    ))),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            image: (DecorationImage(
                image: (AssetImage("images/pharmacyhomepagebg.png")),
                fit: BoxFit.fill))),
        child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                    width: Queries.ScreenWidth(context) / 1.2,
                    height: 75,
                    decoration: BoxDecoration(
                        /*boxShadow: [
                          BoxShadow(
                              color: Color(0XFF5087A0),
                              spreadRadius: 5,
                              blurRadius: 5),
                        ],*/
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white //Color(0xFFC2D5FF),
                        ),
                    child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text("Open/Close",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0XFF5087A0),
                            )),
                      ),
                      trailing: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Transform.scale(
                              scale: 1.8,
                              child: Switch(
                                  activeColor: Color(0XFF50A087),
                                  value: onoff,
                                  onChanged: (bool value) {
                                    setState(() {
                                      onoff = value;
                                    });
                                  }))),
                    )),
                SizedBox(
                  height: 75,
                ),
                Container(
                  width: Queries.ScreenWidth(context) / 1.2,
                  height: 150,
                  decoration: BoxDecoration(
                      /*boxShadow: [
                        BoxShadow(
                            color: Color(0XFF5087A0),
                            spreadRadius: 5,
                            blurRadius: 5),
                      ],*/
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white // Color(0xFFC2D5FF),
                      ),
                  child: Column(children: [
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("Enter your working hours",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                            ))),
                    Flexible(
                        child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 10),
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 25, left: 15),
                          width: 100,
                          height: 100,
                          child: TextField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: "00:00",
                                  hintStyle: TextStyle(color: Colors.grey))),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          width: 25,
                          height: 100,
                          child: Text(
                            "to",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFF5087A0),
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 25, right: 15),
                          width: 100,
                          height: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: "00:00",
                                hintStyle: TextStyle(color: Colors.grey)),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ))
                  ]),
                ),
                SizedBox(
                  height: 300,
                )
              ],
            )),
      ),
    );
  }

  Future<bool> activep() async {
    var data = {'active': '1'};

    var res = await Network().auth(data, '/activep');
    var token = Network().getData(res);
    var body = json.decode(res.body);
    print(token);
    /*SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));*/

    if (onoff == "1") {
      onoff = '0' as bool;
    } else {
      onoff = '1' as bool;
    }
    return onoff;
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
