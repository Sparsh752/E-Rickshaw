// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:ui';

import 'package:erickshaw/screens/driverinfo.dart';
import 'package:erickshaw/screens/select_route.dart';
import 'package:erickshaw/screens/user_choice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../database.dart';

class PassWait extends StatefulWidget {
  const PassWait({Key? key}) : super(key: key);

  @override
  State<PassWait> createState() => _PassWaitState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _PassWaitState extends State<PassWait> {
  late String driver_uid;
  late String from;
  late String to;
  late Map a;
  late Databases db;
  String passuid = "", passfrom = "", passto = "";
  initialise() {
    db = Databases();
    db.initialise();
  }

  late Timer timer;
  final auth = FirebaseAuth.instance;
  late String _uid;
  void initState() {
    super.initState();
    initialise();
    _uid = auth.currentUser?.uid.toString() ?? "";
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      CheckAccepted();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Color.fromRGBO(238, 107, 97, 1.0),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Waiting for driver to confirm your ride',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        db.delete(_uid);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectRoute()));
                      },
                      child: Text('Cancel Ride'),
                      style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all<Color>(
                          //     Color.fromRGBO(238, 107, 97, 1.0)),
                          ),
                    )
                  ],
                ),
              ),
            )));
  }

  Future<void> CheckAccepted() async {
    db.check_request(_uid).then((value) {
      setState(() {
        a = value;
        if (a['pending'] == '1') {
          print(a['from']);
          passfrom = a['from'];
          passto = a['to'];
          passuid = a['driver_uid'];
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => driver_details(
                        uid: passuid,
                        pfrom: passfrom,
                        to: passto,
                      )));
          db.delete(_uid);
          dispose();
        }
      });
    });
  }
}
