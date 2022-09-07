import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:pharma_net/Screens/pharmahomepage.dart';
import 'package:pharma_net/Screens/productdetails.dart';
import 'package:sliverbar_with_card/sliverbar_with_card.dart';
import 'package:pharma_net/Classes/product.dart';
import 'package:pharma_net/data/proddata.dart';
import 'package:pharma_net/data/orderdata.dart';
import 'package:pharma_net/Screens/homepage.dart';
import 'package:pharma_net/Screens/photo.dart';

class cart extends StatefulWidget {
  static String id = '/cart';

  @override
  State<cart> createState() => _cartState();
}

double totalprice = 0.0;

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    if (orderlist.isEmpty) {
      return Scaffold(
          backgroundColor: Color(0xFFC2D5FF),
          body: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: Queries.ScreenHeight(context) / 20),
                      child: Text("Your cart is empty")))));
    } else {
      totalprice = 0.0;
      for (var i = 0; i < orderlist.length; i++) {
        totalprice =
            (orderlist.elementAt(i).quantity * orderlist.elementAt(i).p.price) +
                totalprice;
      }
      return Scaffold(
          backgroundColor: Color(0xFFC2D5FF),
          body: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: Queries.ScreenHeight(context) / 20),
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 1,
                        mainAxisSpacing: Queries.ScreenHeight(context) / 20,
                        childAspectRatio: Queries.ScreenHeight(context) / 450,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        children: orderlist
                            .map((e) => Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(children: [
                                    /*ListTile(*/
                                    Image(
                                        height:
                                            Queries.ScreenHeight(context) / 5,
                                        width:
                                            Queries.ScreenHeight(context) / 5,
                                        fit: BoxFit.fill,
                                        image: AssetImage(e.p.image)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              Queries.ScreenHeight(context) /
                                                  50),
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            Container(
                                              width:
                                                  Queries.ScreenWidth(context) /
                                                      2,
                                              child: Text(
                                                e.p.engname,
                                                style: TextStyle(
                                                  fontSize: 20 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      900,
                                                  color: Color(0xFFC2D5FF),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width:
                                                  Queries.ScreenWidth(context) /
                                                      2,
                                              child: Text(
                                                "${e.p.price}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 20 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        900,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              width:
                                                  Queries.ScreenWidth(context) /
                                                      2,
                                              child: Text(
                                                "pharmacy: ${e.p.pharm.name}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 20 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        900,
                                                    color: Colors.green),
                                              ),
                                            ),
                                            Container(
                                              width:
                                                  Queries.ScreenWidth(context) /
                                                      2,
                                              child: Text(
                                                "distance: ${e.p.pharm.distance(homepage.p)}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 20 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        900,
                                                    color: Colors.green),
                                              ),
                                            ),
                                            Container(
                                              width:
                                                  Queries.ScreenWidth(context) /
                                                      2.5,
                                              height: Queries.ScreenHeight(
                                                      context) /
                                                  15,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFC2D5FF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Center(
                                                child: ListTile(
                                                  horizontalTitleGap: 5,
                                                  leading: IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: () {
                                                        setState(() {
                                                          e.quantity = min(
                                                              e.quantity + 1,
                                                              5);
                                                        });
                                                      },
                                                      color: Colors.white),
                                                  title: Text(
                                                    "${e.quantity}",
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  trailing: IconButton(
                                                      icon: Icon(Icons.remove),
                                                      onPressed: () {
                                                        setState(() {
                                                          e.quantity = max(1,
                                                              e.quantity - 1);
                                                        });
                                                      },
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width:
                                                  Queries.ScreenWidth(context) /
                                                      2.5,
                                              height: Queries.ScreenHeight(
                                                      context) /
                                                  15,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Center(
                                                child: ListTile(
                                                  leading: Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFFC2D5FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                      child: IconButton(
                                                          icon: Icon(
                                                              Icons.delete),
                                                          onPressed: () {
                                                            setState(() {
                                                              e.p.added = false;
                                                              orderlist
                                                                  .remove(e);
                                                            });
                                                          },
                                                          color: Colors.white)),
                                                  trailing: Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFFC2D5FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                      child: IconButton(
                                                          icon: Icon(Icons
                                                              .photo_camera),
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            photo()));
                                                          },
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                                ))
                            .toList()),
                  ),
                  Container(
                    width: Queries.ScreenWidth(context),
                    height: Queries.ScreenHeight(context) / 15,
                    decoration: BoxDecoration(
                        color: Color(0xFFC2D5FF),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Total price is: ${totalprice}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: Queries.ScreenWidth(context) / 2,
                    height: Queries.ScreenHeight(context) / 15,
                    decoration: BoxDecoration(
                        color: Color(0xFFC2D5FF),
                        borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // Foreground color
                        onPrimary: Color(0xFFC2D5FF),
                        // Background color
                        primary: Colors.white,
                      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                      onPressed: () {},
                      child: ListTile(
                        leading: Text(
                          'Check Out',
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                        trailing: IconButton(
                            padding: EdgeInsets.only(bottom: 6),
                            alignment: Alignment.center,
                            iconSize: 27.0,
                            color: Colors.green,
                            icon: Icon(Icons.check),
                            onPressed: () {
                              print("${totalprice}");
                            }),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ]),
              )));
    }
  }
}
