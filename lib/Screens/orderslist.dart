import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:pharma_net/Screens/pharmahomepage.dart';
import 'package:pharma_net/Screens/productdetails.dart';
import 'package:sliverbar_with_card/sliverbar_with_card.dart';
import 'package:pharma_net/Classes/product.dart';
import 'package:pharma_net/data/proddata.dart';
import 'package:pharma_net/Screens/cart.dart';
import 'package:pharma_net/Screens/homepage.dart';
import 'package:pharma_net/data/orderdata.dart';
import 'package:pharma_net/Classes/order.dart';
import 'package:pharma_net/Classes/driverorder.dart';
import 'package:pharma_net/data/driverorderdata.dart';

class orderslist extends StatefulWidget {
  static String id = '/orderslist';
  static driverorder curr = driverorderslist.first;
  @override
  State<orderslist> createState() => _orderslistState();
}

class _orderslistState extends State<orderslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2D5FF),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 10, vertical: Queries.ScreenHeight(context) / 20),
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  mainAxisSpacing: Queries.ScreenHeight(context) / 20,
                  childAspectRatio: Queries.ScreenHeight(context) / 300,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  children: driverorderslist
                      .map((e) => Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(80)),
                            child: InkWell(
                                onTap: () {
                                  orderslist.curr = e;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              productdetails()));
                                },
                                child: Row(children: [
                                  /*ListTile(*/
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            Queries.ScreenHeight(context) / 20),
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 20),
                                            width:
                                                Queries.ScreenWidth(context) /
                                                    2,
                                            child: Text(
                                              "pharmacy: " + e.pharma.name,
                                              style: TextStyle(
                                                fontSize: 20 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    700,
                                                color: Color(0XFF5087A0),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width:
                                                  Queries.ScreenWidth(context) /
                                                      2,
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .location_city_outlined,
                                                    size: 20,
                                                    color: Color(0XFF5087A0),
                                                  ),
                                                  Text(
                                                    "${e.pharma.location.longitude}   ${e.pharma.location.latitude}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 20 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          700,
                                                      color: Color(0XFF5087A0),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            width:
                                                Queries.ScreenWidth(context) /
                                                    2,
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                              "distance: 123km",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 20 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    700,
                                                color: Color(0XFF5087A0),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width:
                                                  Queries.ScreenWidth(context) /
                                                      2,
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.attach_money,
                                                    size: 20,
                                                    color: Color(0XFF5087A0),
                                                  ),
                                                  Text(
                                                    "fees: 123564\$",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 20 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          700,
                                                      color: Color(0XFF5087A0),
                                                    ),
                                                  ),
                                                ],
                                              )),

                                          /*Container(
                                            width:
                                                Queries.ScreenWidth(context) /
                                                    2,
                                            height:
                                                Queries.ScreenHeight(context) /
                                                    20,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFC2D5FF),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: IconButton(
                                                icon: Icon(Icons.shopping_cart),
                                                /*color: e.added
                                                    ? Colors.green
                                                    : Colors.white,*/
                                                onPressed:
                                                    () {} /*
                                                  if (!e.added) {
                                                    e.added = true;
                                                    orderlist.add(new driverorder(
                                                      p: e,
                                                      quantity: 1,
                                                    ));
                                                  } else {
                                                    e.added = false;
                                                    for (int i = 0;
                                                        i < orderlist.length;
                                                        i++) {
                                                      if (orderlist
                                                              .elementAt(i)
                                                              .p ==
                                                          e) {
                                                        orderlist.removeAt(i);
                                                      }
                                                    }
                                                  }
                                                  setState(() {
                                                    e.added = e.added;
                                                  });
                                                }*/
                                                ),
                                          ),*/
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 20,
                                    child: Icon(
                                      Icons.delete_forever,
                                      size: 60,
                                      /*color: Color(0XFF5087A0),*/
                                      color: Colors.green,
                                    ),
                                  )
                                ])),
                          ))
                      .toList()),
            )),
      ),
    );
  }
}
