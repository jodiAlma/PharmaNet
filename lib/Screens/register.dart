import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import 'package:pharma_net/Controller/UserController.dart';
import 'package:pharma_net/Models/AccountModel.dart';
import 'package:pharma_net/Models/user_model.dart';
import 'Login.dart';
import 'emailverification.dart';
import 'dart:convert';
import 'package:pharma_net/Network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  static String id = '/Register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String gender = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
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
                      "Create your account here",
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
                      SizedBox(height: 20),
                      Container(
                        width: Queries.ScreenWidth(context) / 1.2,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: Color(0xFFC2D5FF).withOpacity(0.6),
                        ),
                        child: TextField(
                          controller: phone,
                          decoration: InputDecoration(
                              hintText: "Phone",
                              prefixIcon: Icon(Icons.phone),
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
                          controller: age,
                          decoration: InputDecoration(
                              hintText: "Age",
                              prefixIcon: Icon(Icons.person),
                              border: InputBorder.none),
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 20,
                        width: Queries.ScreenWidth(context) / 1.8,
                        child: Stack(
                          children: [
                            /* Text("Gender",
                              style: TextStyle(
                                  color: Color(0xFF000000), fontSize: 24)),*/
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Radio(
                                    value: "Male",
                                    groupValue: gender,
                                    onChanged: (val) {
                                      setState(() {
                                        gender = val.toString();
                                        print(gender);
                                      });
                                    })),
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 40),
                                    child: Text("Male",
                                        style: TextStyle(
                                          color: Color(0xFF000000),
                                        )))),
                            Container(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: EdgeInsets.only(right: 50),
                                    child: Radio(
                                        value: "Female",
                                        groupValue: gender,
                                        onChanged: (val) {
                                          setState(() {
                                            gender = val.toString();
                                            print(gender);
                                          });
                                        }))),
                            Container(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text("Female",
                                        style: TextStyle(
                                          color: Color(0xFF000000),
                                        )))),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 250,
                        height: 100,
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
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: Text(
                                    "Register",
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
                            UserController userController = UserController();
                            userController.add_user(UserModel(
                                account: AccountModel(
                                    email: email.text,
                                    password: password.text,
                                    type: "user"),
                                age: age.text,
                                gender: gender));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => emailverification()));
                          },
                        ),
                      ),
                      Container(
                          height: 30,
                          width: Queries.ScreenWidth(context) / 1.2,
                          alignment: Alignment.center,
                          child: Row(children: [
                            Text("Already have an account? ",
                                style: TextStyle()),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text("Log in now",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF4C88DE),
                                    )))
                          ])),
                      Container(
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
          ),
        ));
  }

  void _register() async {
    var data = {
      'gender': gender,
      'email': email.text,
      'password': password.text,
      'phone': phone.text,
      'age': age.text
    };

    var res = await Network().auth(data, '/register');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => emailverification()));
    } else {
      _showMsg(body['message']);
    }
  }

  signup(email, password, phone, age) async {
    print("Calling");

    Map data = {
      'email': email,
      'password': password,
      'phone': phone,
      'age': age
    };
    print(data.toString());
    final response = await Network().auth(data, '/login');

    var body = json.decode(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> resposne = jsonDecode(response.body);
      if (!resposne['error']) {
        Map<String, dynamic> user = resposne['data'];
        print(" User name ${user['data']}");
        //savePref(1, user['name'], user['email'], user['id']);
        Navigator.pushReplacementNamed(context, "/login");
      } else {
        print(" ${resposne['message']}");
      }
    } else {
      _showMsg("try again");
    }
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
