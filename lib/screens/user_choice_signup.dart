// ignore_for_file: prefer_const_constructors, unused_import

import 'package:erickshaw/screens/customer.dart';
import 'package:erickshaw/screens/driversign.dart';
import 'package:erickshaw/screens/login.dart';
import 'package:flutter/material.dart';

class UserChoiceSignUp extends StatefulWidget {
  const UserChoiceSignUp({Key? key}) : super(key: key);

  @override
  _UserChoiceSignUp createState() => _UserChoiceSignUp();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _UserChoiceSignUp extends State<UserChoiceSignUp> {
  @override
  Widget build(BuildContext context) {
    ThemeData _lightTheme = ThemeData(
      primarySwatch: Colors.amber,
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(buttonColor: Colors.amber),
      appBarTheme: AppBarTheme(backgroundColor: Colors.red),
    );

    ThemeData _darkTheme = ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        // appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
        buttonTheme:
            ButtonThemeData(buttonColor: Color.fromARGB(255, 224, 72, 26))
        // buttonTheme: ButtonThemeData(buttonColor: Colors.white)
        );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _iconbool ? _darkTheme : _lightTheme,
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.motor1.com/images/mgl/MkkLBN/s1/audi-e-rickshaw-concept-powered-by-second-life-e-tron-battery-modules.jpg',
                    ),
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
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            width: 230,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DriverSign()));
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
                                        builder: (context) =>
                                            customer_login()));
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
                                  //  color: Colors.white70)
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
