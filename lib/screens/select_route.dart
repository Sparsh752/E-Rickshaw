// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, avoid_print, unused_element

import 'package:erickshaw/screens/landingpage.dart';
import 'package:erickshaw/screens/pass_waiting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../database.dart';

class SelectRoute extends StatefulWidget {
  const SelectRoute({Key? key}) : super(key: key);

  @override
  State<SelectRoute> createState() => _SelectRouteState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _SelectRouteState extends State<SelectRoute> {
  late Databases db;
  initialise() {
    db = Databases();
    db.initialise();
  }

  late Map a;
  final auth = FirebaseAuth.instance;
  late String _uid;
  void initState() {
    super.initState();
    initialise();
    _uid = auth.currentUser?.uid.toString() ?? "";
    checking();
  }

  String? fromValue;
  String? toValue;
  String? errormsg;
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
                    fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,

              // backgroundColor: Color.fromRGBO(239, 242, 221, 1),
              appBar: AppBar(
                leadingWidth: 0,
                leading: Text(''),
                title: Text('Select Route', style: TextStyle(color: Colors.yellow),),
                backgroundColor: Color.fromARGB(0, 51, 102, 1),
                actions: [
                  IconButton(
                      onPressed: () {
                        auth.signOut();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Landing()));
                      },
                      icon: Icon(Icons.logout),
                      color: Colors.yellow,)
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "FROM",
                            style: TextStyle(
                              color: Color.fromRGBO(127, 157, 156, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            // textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(189, 215, 214, 1.0),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: Color.fromRGBO(127, 157, 156, 1.0),
                          )),
                      height: 70,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Builder(builder: (context) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor:
                                const Color.fromRGBO(189, 215, 214, 1.0),
                            isExpanded: true,
                            // style: secondStyle,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color.fromRGBO(127, 157, 156, 1.0),
                              size: 30,
                            ),
                            value: fromValue,
                            items: <String>[
                              "KV Gate",
                              "Academic Complex",
                              "Market Complex",
                              "Hostel 1",
                              "Hostel 2",
                              "Subansiri/Dhansiri",
                              "MSH",
                              "GuestHouse",
                              "Hospital",
                              "B/C/D/E/F type"
                            ].map((String val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            }).toList(),
                            onChanged: (String? val) {
                              fromValue = val!;
                              setState(() {});
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "TO",
                            style: TextStyle(
                              color: Color.fromRGBO(127, 157, 156, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            // textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(189, 215, 214, 1.0),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: Color.fromRGBO(127, 157, 156, 1.0),
                          )),
                      height: 70,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Builder(builder: (context) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor:
                                const Color.fromRGBO(189, 215, 214, 1.0),
                            isExpanded: true,
                            // style: secondStyle,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color.fromRGBO(127, 157, 156, 1.0),
                              size: 30,
                            ),
                            value: toValue,
                            items: <String>[
                              "KV Gate",
                              "Academic Complex",
                              "Market Complex",
                              "Hostel 1",
                              "Hostel 2",
                              "Subansiri/Dhansiri",
                              "MSH",
                              "GuestHouse",
                              "Hospital",
                              "B/C/D/E/F type"
                            ].map((String val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            }).toList(),
                            onChanged: (String? val) {
                              toValue = val!;
                              setState(() {});
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      width: 230,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if(toValue==null && fromValue==null){
                            errormsg = "Pickup or Destination address can't be Empty!";
                          }
                          else if (toValue==null) {

                            errormsg = "Destination address missing";
                          } else if (fromValue==null) {
                            
                            errormsg = "PickUp address missing";
                          }
                          else if(fromValue==toValue){
                            
                            errormsg = "PickUp address and Destination address must be different";
                          }
                          else
                          {
                            errormsg = "";
                          }
                          if (errormsg == "") {
                            db.create_request(
                                fromValue!, toValue!, _uid, '0', "");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PassWait()));
                          } else {
                            Fluttertoast.showToast(
                                msg: errormsg!,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1);
                          }
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                        },
                        style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all<Color>(
                          //     Color.fromRGBO(238, 107, 97, 1.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                      side: BorderSide(color: Colors.red))),
                        ),
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.white70
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  Future<void> checking() async {
    db.check_request(_uid).then((value) {
      a = value;
      print(a);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PassWait()));
    });
  }
}
