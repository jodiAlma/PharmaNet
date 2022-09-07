import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pharma_net/Screens/map.dart';

class driverhomepage extends StatefulWidget {
  static Position p = new Position();
  static String id = '/driverhomepage';
  @override
  State<driverhomepage> createState() => _driverhomepageState();
}

class _driverhomepageState extends State<driverhomepage> {
  Color c = Colors.grey;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AwesomeDialog(
          context: context,
          title: 'Location Services',
          animType: AnimType.SCALE,
          dialogType: DialogType.WARNING,
          dismissOnTouchOutside: false,
          btnOkOnPress: () {},
          body: Text('Location services are disabled.'))
        ..show();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) => value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2D5FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        actions: _appbaricons(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      drawer: Drawer(child: ListView(children: <Widget>[])),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            //first child
            Center(
                child: Image(
              image: AssetImage("images/delivery1.png"),
              height: 200,
            )),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: Text(
                  "Check the orders always and don't forgert to change your state and your location",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height -
                    ((MediaQuery.of(context).size.height) / 3 + 65)),
                child: GridView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                                  Icons.phone_in_talk_sharp,
                                  size: 50,
                                  color: Color(0XFF5087A0),
                                ),

                                /*  Image(
                                  image: AssetImage('images/tablet.png'),
                                  width:
                                      ((Queries.ScreenWidth(context) - 50) / 2 -
                                          20),
                                  height:
                                      ((Queries.ScreenWidth(context) - 50) / 2 -
                                          20),
                                ),*/
                                Text(
                                  'Orders',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFC2D5FF),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))),
                    InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Image(
                                  image: AssetImage('images/cosmetics.png'),
                                  width:
                                      ((Queries.ScreenWidth(context) - 50) / 2 -
                                          20),
                                  height:
                                      ((Queries.ScreenWidth(context) - 50) / 2 -
                                          20),
                                ),*/
                                Icon(
                                  Icons.check_circle,
                                  size: 50,
                                  color: Color(0XFF5087A0),
                                ),
                                Text(
                                  'Last works',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFC2D5FF),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))), //2
                    InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /* Image(
                                  image: AssetImage('images/equipments.png'),
                                  width:
                                      ((Queries.ScreenWidth(context) - 50) / 2 -
                                          20),
                                  height:
                                      ((Queries.ScreenWidth(context) - 50) / 2 -
                                          20),
                                ),*/
                                Icon(
                                  Icons.message,
                                  size: 50,
                                  color: Color(0XFF5087A0),
                                ),
                                Text(
                                  'Problems',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFC2D5FF),
                                      fontWeight: FontWeight.bold),
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
                                /*Image(
                                  image: AssetImage('images/baby.png'),
                                  width:
                                      ((Queries.ScreenWidth(context) - 50) / 2 -
                                          20),
                                  height:
                                      ((Queries.ScreenWidth(context) - 50) / 2 -
                                          20),
                                ),*/
                                Icon(
                                  Icons.switch_right,
                                  size: 50,
                                  color: Color(0XFF5087A0),
                                ),
                                Text(
                                  'State',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFC2D5FF),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))), //4
                  ],
                )),
          ]),
        ),
      ),
    );
  }

  List<Widget> _appbaricons() => <Widget>[
        IconButton(
          icon: Icon(Icons.person, size: 30), onPressed: () {},
          color: Colors.grey,
          tooltip: "Profile",
          //action
        ),
        IconButton(
          icon: Icon(Icons.logout, size: 30),
          onPressed: () {},
          color: Colors.grey,
          tooltip: "Log out",
        ),
        //action
        IconButton(
          color: c,
          icon: Icon(Icons.location_on),
          onPressed: () async {
            try {
              driverhomepage.p = await _determinePosition();
              /*List<Placemark> placemarks =
                    await placemarkFromCoordinates(52.2165157, 6.9437819);*/
              setState(() {
                c = Colors.blue;
              });
              print(
                  '${driverhomepage.p.latitude}, ${driverhomepage.p.longitude}'); //, ${placemarks[0].country}');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => map()));
            } catch (e) {
              print(e);
            }
          },
        )
      ];
}
