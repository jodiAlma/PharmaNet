import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'package:pharma_net/Controller/UserController.dart';
import 'package:pharma_net/Models/AccountModel.dart';
import 'package:pharma_net/Models/user_model.dart';
import 'package:pharma_net/Screens/forgetpassword.dart';
import 'package:pharma_net/Screens/productdetails.dart';
import './register.dart';
import 'forgetpassword.dart';
import 'homepage.dart';
import 'pharmahomepage.dart';
import 'driverhomepage.dart';
import 'dart:convert';
import 'package:pharma_net/Network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static String id = '/Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String Type = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, Queries.ScreenHeight(context) / 16, 0, 0),
                  child: Text(
                    "Welcome to PharmaNet",
                    style: TextStyle(
                        fontSize: 28,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Cardo',
                        color: Color(0xFF4C88DE)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      "Enter your credentials, please",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontFamily: 'Cardo',
                          color: Color(0xFFFFB349)),
                    )),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        width: Queries.ScreenWidth(context) / 1.2,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: Color(0xFFC2D5FF).withOpacity(0.6),
                        ),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email),
                              border: InputBorder.none),
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: Queries.ScreenWidth(context) / 1.2,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: Color(0xFFC2D5FF).withOpacity(0.6),
                        ),
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: InputBorder.none),
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "user",
                              groupValue: Type,
                              onChanged: (val) {
                                setState(() {
                                  Type = val.toString();
                                  print(Type);
                                });
                              }),
                          Text("Customer",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              )),
                          Radio(
                              //value: "Pharmacist",
                              value: "pharmacy",
                              groupValue: Type,
                              onChanged: (val) {
                                setState(() {
                                  Type = val.toString();
                                  print(Type);
                                });
                              }),
                          Text("Pharmacist",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              )),
                          Radio(
                              value: "driver",
                              groupValue: Type,
                              onChanged: (val) {
                                setState(() {
                                  Type = val.toString();
                                  print(Type);
                                });
                              }),
                          Text("Driver",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              )),
                        ],
                      ),
                      SizedBox(height: Queries.ScreenHeight(context) / 37),
                      Container(
                        alignment: Alignment.center,
                        width: 250,
                        height: 80,
                        child: TextButton(
                          child: Stack(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Image(
                                image: AssetImage('images/capsulebutton.png'),
                                width: 75,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 75),
                                  child: Text(
                                    "Log in",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xFF4C88DE),
                                        fontFamily: 'Cardo',
                                        fontStyle: FontStyle.italic),
                                  ),
                                ))
                          ]),
                          onPressed: () {
                            print(email.text + password.text + Type);
                            UserController userController = UserController();
                            userController.login(
                                email.text, password.text, Type);
                            if (Type == "pharmacy") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pharmahomepage()));
                            } else if (Type == "user") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => homepage()));
                            } else if (Type == "driver") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => driverhomepage()));
                            } else {
                              _showMsg("Credentials are not correct!");
                            }
                          },
                        ),
                      ),
                      SizedBox(height: Queries.ScreenHeight(context) / 37),
                      Container(
                          height: 30,
                          width: Queries.ScreenWidth(context) / 1.4,
                          child: Stack(children: [
                            //Text("Don't have an account? ", style: TextStyle()),
                            FlatButton(
                                minWidth: 125,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                color: Color(0xFFC2D5FF).withOpacity(0.6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                                child: Text("Register now",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.green))),
                            Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                    minWidth: 125,
                                    color: Color(0xFFC2D5FF).withOpacity(0.6),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  forgetpassword()));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0)),
                                    child: Text("Forgot password",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.green))))
                          ])),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 200,
                        child: Image(
                          image: AssetImage("images/registerbg.jpg"),
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  // void _login(UserModel userModel) async {
  //   //var data = {'email': email.text, 'password': password.text, 'type': Type};
  //   var res = await Network().auth(userModel, '/login');

  //   var body = json.decode(res.body);
  //   /*SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.setString('token', json.encode(body['token']));
  //     localStorage.setString('user', json.encode(body['user']));*/

  //   if (res.statusCode == 200) {
  //     storage.setItem('token', res['token']['access_token']);
  //   }
  // }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
