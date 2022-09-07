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

import '../Controller/ProductController.dart';

class productslist extends StatefulWidget {
  static String id = '/productslist';
  static product curr = productlist.first;
  @override
  State<productslist> createState() => _productslistState();
}

class _productslistState extends State<productslist> {
  ProductController productController = ProductController();

  @override
  void initState() {
    super.initState();
    //var products = productController.getAllProduct();
  }

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
                  children: productlist
                      .map((e) => Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: InkWell(
                                onTap: () {
                                  productslist.curr = e;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              productdetails()));
                                },
                                child: Row(children: [
                                  /*ListTile(*/
                                  Image(
                                      height: Queries.ScreenHeight(context) / 5,
                                      width: Queries.ScreenHeight(context) / 5,
                                      fit: BoxFit.fill,
                                      image: AssetImage(e.image)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            Queries.ScreenHeight(context) / 35),
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Container(
                                            width:
                                                Queries.ScreenWidth(context) /
                                                    2,
                                            child: Text(
                                              e.engname,
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
                                              "${e.price}",
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
                                              "pharmacy: ${e.pharm.name}",
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
                                              "distance: ${e.pharm.distance(homepage.p)}",
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
                                            height:
                                                Queries.ScreenHeight(context) /
                                                    20,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFC2D5FF),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: IconButton(
                                                icon: Icon(Icons.shopping_cart),
                                                color: e.added
                                                    ? Colors.green
                                                    : Colors.white,
                                                onPressed: () {
                                                  if (!e.added) {
                                                    e.added = true;
                                                    orderlist.add(new order(
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
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  /*trailing: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove_red_eye),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    productdetails()));
                                      },
                                    ),
                                    Text(
                                      '${e.price}',
                                      style: TextStyle(
                                          fontSize: 7 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              900,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),*/
                                ])),
                          ))
                      .toList()),
            )),
        /* decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pharmacy.jpg'),
            repeat: ImageRepeat.repeat,
            //fit: BoxFit.fitHeight,
          ),
        ),*/
      ),
    );
  }
}
