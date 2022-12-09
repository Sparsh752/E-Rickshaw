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
      // buttonTheme: ButtonThemeData(buttonColor: Colors.amberAccent),
      appBarTheme: AppBarTheme(backgroundColor: Colors.red),
    );

    ThemeData _darkTheme = ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        // appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
        buttonTheme:
            ButtonThemeData(buttonColor: Color.fromARGB(255, 224, 72, 26)));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _iconbool ? _darkTheme : _lightTheme,
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.motor1.com/images/mgl/MkkLBN/s1/audi-e-rickshaw-concept-powered-by-second-life-e-tron-battery-modules.jpg',
                    ),
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
                              // backgroundColor: MaterialStateProperty.all<Color>(
                              //     Color.fromRGBO(250, 171, 51, 1.000)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                // side: BorderSide(
                                //     color: Color.fromRGBO(250, 171, 51, 1))
                              )),
                            ),
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 16,
                                // color: Color.fromARGB(179, 0, 0, 0)
                              ),
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
                                      builder: (context) =>
                                          UserChoiceSignUp()));
                            },
                            style: ButtonStyle(
                              // backgroundColor: MaterialStateProperty.all<Color>(
                              //     Color.fromRGBO(250, 171, 51, 1)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                // side: BorderSide(
                                //     color: Color.fromRGBO(250, 171, 51, 1))
                              )),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                // color: Color.fromARGB(179, 0, 0, 0)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
