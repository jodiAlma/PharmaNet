import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:pharma_net/Screens/productslist.dart';
import 'package:sliverbar_with_card/sliverbar_with_card.dart';
import 'package:pharma_net/Classes/product.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharma_net/Classes/pharmacy.dart';

class productdetails extends StatefulWidget {
  static String id = '/productdetails';
  @override
  _productdetailsState createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  bool order = false;
  bool expandText = false;
  product p = productslist.curr;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "product details",
      home: Material(
        /*color: Color(0xFFC2D5FF),*/
        child: Container(
          color: Color(0xFFC2D5FF),
          child: CardSliverAppBar(
            height: 300,
            background: Image.asset(
              p.image,
              fit: BoxFit.cover,
            ),
            title: Text("${p.engname}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            titleDescription: Text("Company: " + "${p.company_id}",
                style: TextStyle(color: Colors.black, fontSize: 11)),
            card: AssetImage("${p.category}"),
            backButton: false,
            backButtonColors: [
              Colors.white,
              Color(0xFFC2D5FF),
            ],
            action: IconButton(
              onPressed: () {
                setState(() {
                  order = !order;
                });
              },
              icon: order ? Icon(Icons.add_shopping_cart) : Icon(Icons.check),
              color: Colors.red,
              iconSize: 30.0,
            ),
            body: Container(
              alignment: Alignment.topLeft,
              /*color: Color(0xFFC2D5FF),*/
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _ratingIcon(
                          Icon(Icons.calendar_today),
                          //strength= caliber
                          Text("${p.caliber}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        _ratingIcon(
                            Icon(Icons.attach_money),
                            Text("${p.price}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                        _ratingIcon(
                            Icon(Icons.medication),
                            Text("${p.phamacological_form}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                        _ratingIcon(
                            Icon(Icons.paste_outlined),
                            Text("${p.prescription}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                      height: expandText ? 145 : 0,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: Text(
                        "Formula: ${p.formula}" +
                            "\n" +
                            "Details: ${p.details}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 30),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            expandText = !expandText;
                          });
                        },
                        child:
                            Text(expandText ? "Less Details" : "More Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.red,
                                ))),
                  )
                  /*Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _exampleRelatedShow(),
                        _exampleRelatedShow(),
                        _exampleRelatedShow(),
                        _exampleRelatedShow(),
                        _exampleRelatedShow(),
                        _exampleRelatedShow(),
                        _exampleRelatedShow(),
                        _exampleRelatedShow(),
                        _exampleRelatedShow(),
                        _exampleRelatedShow(),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
/*
  Widget _exampleRelatedShow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.blue,
      ),
      width: 80,
      height: 100,
    );
  }*/

  Widget _ratingIcon(Icon icon, Text text) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: IconButton(
              onPressed: () {},
              icon: icon,
              color: Colors.white,
              iconSize: 30,
            ),
          ),
          text
        ],
      ),
    );
  }
}
