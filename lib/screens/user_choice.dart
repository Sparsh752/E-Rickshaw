// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:erickshaw/screens/driversign.dart';
import 'package:erickshaw/screens/login.dart';
import 'package:erickshaw/screens/login_driver.dart';
import 'package:flutter/material.dart';

class UserChoice extends StatefulWidget {
  const UserChoice({Key? key}) : super(key: key);

  @override
  State<UserChoice> createState() => _UserChoice();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _UserChoice extends State<UserChoice> {
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

        // appBarTheme:
        //     AppBarTheme(backgroundColor: Color.fromARGB(0, 51, 102, 1)),
        buttonTheme:
            ButtonThemeData(buttonColor: Color.fromRGBO(255, 110, 64, 1)));

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
                    fit: BoxFit.cover)),
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
              // backgroundColor: Color.fromRGBO(239, 242, 221, 1),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: 230,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login_Driver()));
                            },
                            style: ButtonStyle(
                              // backgroundColor: MaterialStateProperty.all<Color>(
                              //     Color.fromRGBO(238, 107, 97, 1.0)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                // side: BorderSide(color: Colors.red)
                              )),
                            ),
                            child: Text(
                              'Driver',
                              style: TextStyle(
                                fontSize: 16,
                                // color: Colors.white70),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: 230,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            style: ButtonStyle(
                              // backgroundColor: MaterialStateProperty.all<Color>(
                              //     Color.fromRGBO(238, 107, 97, 1.0)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                // side: BorderSide(color: Colors.red)
                              )),
                            ),
                            child: Text(
                              'Passenger',
                              style: TextStyle(
                                fontSize: 16,
                                //  color: Colors.white70),
                              ),
                            ),
                          ))
                    ]),
                  ),
                ],
              ),
            )));
  }
}
