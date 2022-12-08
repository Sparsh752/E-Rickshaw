// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:erickshaw/screens/user_choice.dart';
import 'package:erickshaw/screens/user_choice_signup.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _LandingState extends State<Landing> {
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
      appBarTheme: AppBarTheme(backgroundColor: Colors.blue),

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
                                  builder: (context) => UserChoice()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(238, 107, 97, 1.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red))),
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ),
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
                                  builder: (context) => UserChoiceSignUp()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(238, 107, 97, 1.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red))),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
