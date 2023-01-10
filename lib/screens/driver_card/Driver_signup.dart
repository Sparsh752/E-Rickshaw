// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:erickshaw/database.dart';
import 'package:erickshaw/screens/driver_card/EmailVerification_Driver.dart';
import 'package:erickshaw/screens/driver_card/Driver_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DriverSign extends StatefulWidget {
  const DriverSign({Key? key}) : super(key: key);

  @override
  State<DriverSign> createState() => _DriverSignState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _DriverSignState extends State<DriverSign> {
  late Databases db;
  initialise() {
    db = Databases();
    db.initialise();
  }

  late String _uid;
  void initState() {
    super.initState();
    initialise();
    // _uid=auth.currentUser?.uid.toString()??"";
  }

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _confirmpassword = TextEditingController();
  final _numberplate = TextEditingController();
  final _number = TextEditingController();
  final auth = FirebaseAuth.instance;
  String? errormsg;
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController emailcontroller = new TextEditingController();
  // final TextEditingController passwordcontroller = new TextEditingController();
  // final TextEditingController usernamecontroller = new TextEditingController();
  // final TextEditingController cpasswordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData _lightTheme = ThemeData(
      primarySwatch: Colors.amber,
      brightness: Brightness.light,
      // buttonTheme: ButtonThemeData(buttonColor: Colors.black),
      appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(0, 51, 102, 1)),
    );

    ThemeData _darkTheme = ThemeData(
      primarySwatch: Colors.deepOrange,
      brightness: Brightness.dark,
      // appBarTheme: AppBarTheme(backgroundColor: Colors.blue),

      // buttonTheme: ButtonThemeData(buttonColor: Colors.white)
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _iconbool ? _darkTheme : _lightTheme,
        home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bg.png',
                  ),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  fit: BoxFit.fitHeight)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
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
            // backgroundColor: Colors.white,
            // backgroundColor: Color.fromRGBO(239, 242, 221, 1),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Container(
                      height: 100,
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
                              _name.text = value.trim();
                            });
                          },
                          autofillHints: [AutofillHints.name],
                          decoration: const InputDecoration(
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(81, 99, 101, 1.0)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
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
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            setState(() {
                              _number.text = value.trim();
                            });
                          },
                          autofillHints: [AutofillHints.telephoneNumber],
                          decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(81, 99, 101, 1.0)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
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
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              _email.text = value.trim();
                            });
                          },
                          autofillHints: [AutofillHints.email],
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(81, 99, 101, 1.0)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
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
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              _password.text = value.trim();
                            });
                          },
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(81, 99, 101, 1.0)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
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
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              _confirmpassword.text = value.trim();
                            });
                          },
                          decoration: InputDecoration(
                              hintText: 'Confirm password',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(81, 99, 101, 1.0)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
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
                              _numberplate.text = value.trim();
                            });
                          },
                          decoration: InputDecoration(
                              hintText: 'Number Plate',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(81, 99, 101, 1.0)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      width: 230,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_name.text.isEmpty) {
                            errormsg = "Name can't be empty";
                          } else if (_number.text.isEmpty) {
                            errormsg = "Number can't be empty";
                          } else if (_email.text.isEmpty) {
                            errormsg = "Email can't be empty";
                          } else if (_password.text.isEmpty) {
                            errormsg = "Password can't be empty";
                          } else if (_confirmpassword.text.isEmpty) {
                            errormsg = "Confirm Password can't be empty";
                          } else if (_numberplate.text.isEmpty) {
                            errormsg = "Number Plate can't be empty";
                          } else if (_confirmpassword.text != _password.text) {
                            errormsg = "Password doesn't match";
                          } else if (_number.text.length != 10) {
                            errormsg = "Number is of wrong format";
                          } else {
                            errormsg = "";
                          }
                          if (errormsg == "") {
                            try {
                              await auth.createUserWithEmailAndPassword(
                                  email: _email.text, password: _password.text);
                              auth.signInWithEmailAndPassword(
                                  email: _email.text, password: _password.text);
                              _uid = auth.currentUser?.uid.toString() ?? "";
                              db.create_driver(_name.text, _uid, _number.text,
                                  _email.text, _numberplate.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EmailVerification_Driver()));
                            } on FirebaseAuthException catch (error) {
                              print(error.code);
                              Fluttertoast.showToast(
                                  msg: error.code,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1);
                            }
                          } else {
                            print(errormsg);
                            Fluttertoast.showToast(
                                msg: errormsg!,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1);
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hello')));
                          }

                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            // side: BorderSide(color: Colors.red)
                          )),
                          // backgroundColor: MaterialStateProperty.all<Color>(
                          //     Color.fromRGBO(238, 107, 97, 1.0)),
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.white70
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20.0,
                    ),
                    Divider(
                      thickness: 0.4,
                      color: Color.fromRGBO(81, 99, 101, 1.0),
                      indent: 30,
                      endIndent: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: Color.fromRGBO(81, 99, 101, 1.0),
                                fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login_Driver()));
                            },
                            child: Text(" Sign in.",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
