import 'dart:async';

import 'package:erickshaw/screens/driver_card/card_model.dart';
import 'package:erickshaw/screens/landingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../database.dart';
import '../passinfo.dart';

class DriverOptions extends StatefulWidget {
  const DriverOptions({Key? key}) : super(key: key);

  @override
  State<DriverOptions> createState() => _DriverOptionsState();
}

class _DriverOptionsState extends State<DriverOptions> {
  final auth = FirebaseAuth.instance;
  var storage=FirebaseStorage.instance;
  late Databases db;
  String passuid="", passfrom="", passto="";
  List docs=[];

  initialise(){
    db=Databases();
    db.initialise();
  }
  late Timer timer;
  late String _uid;
  @override
  void initState(){
    super.initState();
    initialise();
    timer=Timer.periodic(Duration(seconds: 1), (timer) {
      Reload();
    });
    // initialise();
    _uid=auth.currentUser?.uid.toString()??"";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 242, 221, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(238, 107, 97, 1.0),
        leadingWidth: 0.0,
        leading: Text(''),
        title: Text('Available Rides'),
        actions: [
          IconButton(
              onPressed: (){
                auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Landing()
                    )
                );
              },
              icon: Icon(Icons.logout)
          )
        ],
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext Context, int index){
          return Card(
            elevation: 10,
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(docs[index]['from']),
                    Icon(Icons.arrow_forward_outlined),
                    Text(docs[index]['to']),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 60,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          print(docs[index]);
                          db.create_request(docs[index]['from'],docs[index]['to'], docs[index]['id'],'1',_uid);
                          passuid=docs[index]['id'];
                          passfrom=docs[index]['from'];
                          passto=docs[index]['to'];
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Userdetails(uid: passuid, pfrom: passfrom, to: passto)));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(238, 107, 97, 1.0)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                  side: BorderSide(color: Colors.red)
                              )
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Future<void> Reload() async {
    db.read().then((value) => {
      setState((){
        docs=value;
      })
    });}
}

