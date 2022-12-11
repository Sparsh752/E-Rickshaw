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
      appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(0, 51, 102, 1)),
    );

    ThemeData _darkTheme = ThemeData(
        primarySwatch: Colors.deepOrange,
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
                      'https://images.unsplash.com/photo-1527708990900-6675e4de3e03?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmlja3NoYXd8ZW58MHx8MHx8&w=1000&q=80',
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
