import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'package:geolocator/geolocator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pharma_net/Screens/map.dart';
import 'package:pharma_net/Screens/productslist.dart';
import 'package:pharma_net/Screens/cart.dart';

class homepage extends StatefulWidget {
  static Position p = new Position();
  static String id = '/homepage';
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => homepage()));
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
                child: Image(image: AssetImage("images/homepageheader.png"))),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: Text("Categories:",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
                height: 380,
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
                              Image(
                                image: AssetImage('images/tablet.png'),
                                width:
                                    ((Queries.ScreenWidth(context) - 50) / 2 -
                                        20),
                                height:
                                    ((Queries.ScreenWidth(context) - 50) / 2 -
                                        20),
                              ),
                              Text(
                                'Medicine',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFC2D5FF),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      onTap: () {
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
                              Image(
                                image: AssetImage('images/cosmetics.png'),
                                width:
                                    ((Queries.ScreenWidth(context) - 50) / 2 -
                                        20),
                                height:
                                    ((Queries.ScreenWidth(context) - 50) / 2 -
                                        20),
                              ),
                              Text(
                                'Hygiene',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFC2D5FF),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => productslist()));
                      },
                    ), //2
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('images/equipments.png'),
                                width:
                                    ((Queries.ScreenWidth(context) - 50) / 2 -
                                        20),
                                height:
                                    ((Queries.ScreenWidth(context) - 50) / 2 -
                                        20),
                              ),
                              Text(
                                'Equipemnts',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFC2D5FF),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => productslist()));
                      },
                    ), //3
                    InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('images/baby.png'),
                                width:
                                    ((Queries.ScreenWidth(context) - 50) / 2 -
                                        20),
                                height:
                                    ((Queries.ScreenWidth(context) - 50) / 2 -
                                        20),
                              ),
                              Text(
                                'Baby Products',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFC2D5FF),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => productslist()));
                      },
                    ), //4
                  ],
                )),
          ]),
        ),
      ),
    );
  }

  List<Widget> _appbaricons() => <Widget>[
        IconButton(
          icon: Icon(Icons.search, size: 30), onPressed: () {},
          color: Colors.grey,
          tooltip: "Search",
          //action
        ),
        IconButton(
          icon: Icon(Icons.shopping_basket_outlined, size: 30),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => cart()));
          },
          color: Colors.grey,
          tooltip: "Cart",
          //action
        ),
        IconButton(
          color: c,
          icon: Icon(Icons.location_on),
          onPressed: () async {
            try {
              homepage.p = await _determinePosition();
              /*List<Placemark> placemarks =
                    await placemarkFromCoordinates(52.2165157, 6.9437819);*/
              setState(() {
                c = Colors.blue;
              });
              print(
                  '${homepage.p.latitude}, ${homepage.p.longitude}'); //, ${placemarks[0].country}');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => map()));
            } catch (e) {
              print(e);
            }
          },
        )
      ];
}
