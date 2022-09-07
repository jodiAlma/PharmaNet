import 'package:flutter/material.dart';
import './Screens/PharmaManage.dart';
import './Screens/resetpassword.dart';
import './Screens/Splash.dart';
import './Screens/Login.dart';
import './Screens/register.dart';
import './Screens/emailverification.dart';
import './Screens/forgetpassword.dart';
import './Screens/homepage.dart';
import './Screens/pharmahomepage.dart';
import './Screens/productdetails.dart';
import './Screens/Map.dart';
import './Screens/driverhomepage.dart';
import './Screens/productslist.dart';
import 'Screens/cart.dart';
import 'Screens/photo.dart';
import './Screens/orderslist.dart';
import 'Screens/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PharmaNet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      routes: {
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        emailverification.id: (context) => emailverification(),
        resetpassword.id: (context) => resetpassword(),
        forgetpassword.id: (context) => forgetpassword(),
        homepage.id: (context) => homepage(),
        pharmahomepage.id: (context) => pharmahomepage(),
        pharmamanage.id: (context) => pharmamanage(),
        productdetails.id: (context) => productdetails(),
        map.id: (context) => map(),
        driverhomepage.id: (context) => driverhomepage(),
        productslist.id: (context) => productslist(),
        cart.id: (context) => cart(),
        photo.id: (context) => photo(),
        orderslist.id: (context) => orderslist(),
        details.id: (context) => details(),
      },
    );
  }
}
