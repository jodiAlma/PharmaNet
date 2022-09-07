import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'package:pharma_net/Screens/PharmaManage.dart';
import 'package:pharma_net/Screens/productslist.dart';

import '../Network/api.dart';

class pharmahomepage extends StatefulWidget {
  static String id = '/pharmacyhomepage';
  @override
  _pharmahomepageState createState() => _pharmahomepageState();
}

class _pharmahomepageState extends State<pharmahomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2D5FF),
      appBar: AppBar(
        elevation: 0.0,
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
        margin: EdgeInsetsDirectional.all(0.0),
        /*decoration: BoxDecoration(
            image: (DecorationImage(
                image: (AssetImage("images/.png")),
                fit: BoxFit.fill))),
        width: double.infinity,*/
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //first child
              Center(
                  child: Image(image: AssetImage("images/homepageheader.png"))),
              /*  Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Text("Categories:",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),*/
              SizedBox(
                height: 380,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  children: [
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.list_alt_outlined,
                                size: 50,
                                color: Color(0XFF5087A0),
                              ),
                              Text(
                                "All Products",
                                style: TextStyle(
                                  color: Color(0XFF5087A0),
                                  fontSize: 20,
                                ),
                              )
                            ],
                          )),
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => productslist()));
                      },
                    ),
                    InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart_rounded,
                                  size: 50,
                                  color: Color(0XFF5087A0),
                                ),
                                Text(
                                  "Sells",
                                  style: TextStyle(
                                    color: Color(0XFF5087A0),
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ))),
                    //2
                    InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.update,
                                  size: 50,
                                  color: Color(0XFF5087A0),
                                ),
                                Text(
                                  "Trending",
                                  style: TextStyle(
                                    color: Color(0XFF5087A0),
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ))), //3
                    InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_sharp,
                                  size: 50,
                                  color: Color(0XFF5087A0),
                                ),
                                Text(
                                  "Add product",
                                  style: TextStyle(
                                    color: Color(0XFF5087A0),
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ))), //4
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
