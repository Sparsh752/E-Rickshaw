// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../database.dart';

class Userdetails extends StatefulWidget {
  Userdetails(
      {Key? key, required this.uid, required this.pfrom, required this.to})
      : super(key: key);

  final String uid;
  final String pfrom;
  final String to;

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _UserdetailsState extends State<Userdetails> {
  late Map a;
  late Databases db;
  String passname = "";
  String passphone = "";
  initialise() {
    db = Databases();
    db.initialise();
  }

  @override
  void initState() {
    super.initState();
    initialise();
    get_info();
  }

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
          // backgroundColor: Color.fromRGBO(239, 242, 221, 1),
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
            // backgroundColor: Color.fromRGBO(238, 107, 97, 1.0),
            title: Text('Passenger details'),
            elevation: 0.0,
          ),
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Name',
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${passname}',
                  style: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(238, 107, 97, 1.0)),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Phone number',
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${passphone}',
                  style: TextStyle(
                    color: Color.fromRGBO(238, 107, 97, 1.0),
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'from',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 10,),
                    Text(
                      '${widget.pfrom}',
                      style: TextStyle(
                        color: Color.fromRGBO(238, 107, 97, 1.0),
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'to',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 10,),
                    Text(
                      '${widget.to}',
                      style: TextStyle(
                        color: Color.fromRGBO(238, 107, 97, 1.0),
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> get_info() async {
    db.get_passenger(widget.uid).then((value) {
      setState(() {
        a = value;
        passname = a['name'];
        passphone = a['number'];
        print(a['name']);
      });
    });
  }
}
