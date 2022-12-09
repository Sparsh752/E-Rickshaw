// ignore_for_file: prefer_const_constructors, unused_element, use_build_context_synchronously

import 'package:erickshaw/screens/driver_card/DriverOptions.dart';
import 'package:erickshaw/screens/driversign.dart';
import 'package:erickshaw/screens/emailVerification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:erickshaw/screens/forgot_password.dart';

class Login_Driver extends StatefulWidget {
  const Login_Driver({Key? key}) : super(key: key);

  @override
  State<Login_Driver> createState() => _Login_DriverState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _Login_DriverState extends State<Login_Driver> {
  late String _email;
  late String _password;
  final auth = FirebaseAuth.instance;
  String? errormsg;
  @override
  Widget build(BuildContext context) {
    ThemeData _lightTheme = ThemeData(
      primarySwatch: Colors.amber,
      brightness: Brightness.light,
      // buttonTheme: ButtonThemeData(buttonColor: Colors.black),
      appBarTheme: AppBarTheme(backgroundColor: Colors.red),
    );

    ThemeData _darkTheme = ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.dark,
      // appBarTheme: AppBarTheme(backgroundColor: Colors.blue),

      // buttonTheme: ButtonThemeData(buttonColor: Colors.white)
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _iconbool ? _darkTheme : _lightTheme,
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _iconbool = !_iconbool;
                    });
                  },
                  icon: Icon(_iconbool ? _iconDark : _iconLight))
            ],
          ),
          // backgroundColor: Color.fromRGBO(239, 242, 221, 1.0),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 50,
                  width: 280,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(189, 215, 214, 1.0),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: Color.fromRGBO(127, 157, 156, 1.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(81, 99, 101, 1.0)),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 50,
                  width: 280,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(189, 215, 214, 1.0),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: Color.fromRGBO(127, 157, 156, 1.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(81, 99, 101, 1.0)),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 230,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential user =
                            await auth.signInWithEmailAndPassword(
                                email: _email, password: _password);
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailVerification_Driver()));
                        }
                      } on FirebaseAuthException catch (error) {
                        switch (error.code) {
                          case "invalid-email":
                            errormsg = "Your email is wrong";
                            break;
                          case "wrong-password":
                            errormsg = "Password entered is wrong";
                            break;
                          case "user-not-found":
                            errormsg = "User with this email is not found";
                            break;
                          case "user-disabled":
                            errormsg = "User is disabled";
                            break;
                          case "too-many-request":
                            errormsg = "Facing too many requests now";
                            break;
                          case "operation-not-allowed":
                            errormsg = "Operation not allowed";
                            break;
                          default:
                            errormsg = "Undefined error occured";
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${errormsg}')));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(238, 107, 97, 1.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                              side: BorderSide(color: Colors.red))),
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                      },
                      child: Text("Forgot Password?",
                          style: TextStyle(
                            color: Color.fromRGBO(238, 107, 97, 1.0),
                            fontSize: 16,
                          )),
                    ),
                  ],
                ),
                Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 0.4,
                  color: Color.fromRGBO(81, 99, 101, 1.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Color.fromRGBO(81, 99, 101, 1.0),
                          fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DriverSign()));
                      },
                      child: Text(" Sign up.",
                          style: TextStyle(
                            color: Color.fromRGBO(238, 107, 97, 1.0),
                            fontSize: 16,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
