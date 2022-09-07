import 'package:flutter/material.dart';
import 'package:pharma_net/Screens/driverhomepage.dart';

class details extends StatelessWidget {
  static String id = '/details';
  double height = 0.0, width = 0.0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;
    return Scaffold(
      /*  appBar: AppBar(
        backgroundColor: Color(0xFFC2D5FF),
        elevation: 0.0,
        //leading
        titleSpacing: 0.0,
        title: IconButton(
          icon: Icon(Icons.home, size: 30),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => driverhomepage()));
          },
          color: Colors.grey,
          tooltip: "home",
          //action
        ),
        iconTheme: IconThemeData(color: Colors.grey),
     */
      drawer: Drawer(child: ListView(children: <Widget>[])),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height * .5,
                decoration: BoxDecoration(
                  color: Color(0xFFC2D5FF),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50)),
                ),
                child: SafeArea(
                    child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.home, size: 30),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => driverhomepage()));
                    },
                    color: Colors.grey,
                    tooltip: "home",
                    //action
                  ),
                )),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFC2D5FF),
                ),
                child: Container(
                  height: height * .5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      ListTile(
                          leading: Icon(Icons.local_pharmacy_outlined),
                          title: Text("pharmacy name:",
                              style: TextStyle(color: Colors.grey))),
                      ListTile(
                          leading: Icon(Icons.person_rounded),
                          title: Text(
                            "Customer name:",
                            style: TextStyle(color: Colors.grey),
                          )),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Go from:",
                            style: TextStyle(color: Colors.grey)),
                      ),
                      ListTile(
                        leading: Icon(Icons.person_pin_circle_sharp),
                        title: Text("Delivery to:",
                            style: TextStyle(color: Colors.grey)),
                      ),
                      Center(
                          child: Container(
                              width: 100,
                              height: 30,
                              alignment: Alignment.center,
                              child: Text("  Accept  "),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ))),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            child: Container(
                height: height * .1,
                width: width,
                margin: const EdgeInsets.only(
                  top: 70,
                ),
                child: ListTile(
                    leading: IconButton(
                        icon: Icon(Icons.phone_forwarded_sharp, size: 30),
                        onPressed: () {},
                        color: Colors.green),
                    title: Text(
                      "Custumer phone:",
                      style: TextStyle(color: Colors.green),
                    ))),
          ),
          Positioned(
            child: Container(
                height: height * .1,
                width: width,
                margin: const EdgeInsets.only(
                  top: 130,
                ),
                child: ListTile(
                    leading: IconButton(
                        icon: Icon(Icons.phone, size: 30),
                        onPressed: () {},
                        color: Colors.green),
                    title: Text(
                      "pharmacy phone:",
                      style: TextStyle(color: Colors.green),
                    ))),
          ),
          Positioned(
            top: height * .6 - (height * .4),
            left: .6,
            child: Container(
              height: height * .5,
              width: width * .5,
              child: Image(image: AssetImage("images/delivery1.png")),
            ),
          ),
        ],
      ),
    );
  }
}
