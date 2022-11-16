import 'package:flutter/material.dart';

import '../database.dart';


class driver_details extends StatefulWidget {
  driver_details({Key? key, required this.uid, required this.pfrom, required this.to}) : super(key: key);
  final String uid;
  final String pfrom;
  final String to;
  @override
  State<driver_details> createState() => _driver_detailsState();
}

class _driver_detailsState extends State<driver_details> {

  late Map a;
  late Databases db;
  String passname="";
  String passphone="";
  String passplate="";
  initialise() {
    db = Databases();
    db.initialise();
  }
  @override
  void initState(){
    super.initState();
    initialise();
    get_info();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 242, 221, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(238, 107, 97, 1.0),
        title: const Center(
          child: Text('Driver details'),
        ),
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
            SizedBox(height: 10,),
            Text(
              '${passname}',
              style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(238, 107, 97, 1.0)
              ),
            ),

            SizedBox(height: 30,),
            Text(
              'vehicle plate number',
              style: TextStyle(
                letterSpacing: 1.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '${passplate}',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(238, 107, 97, 1.0),
              ),
            ),
            SizedBox(height: 30,),
            Text(
              'Phone number',
              style: TextStyle(
                letterSpacing: 1.5,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '${passphone}',
              style: TextStyle(
                color: Color.fromRGBO(238, 107, 97, 1.0),
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
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
            SizedBox(height: 30,),
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
    );
  }
  Future<void> get_info() async {
    db.get_driver(widget.uid).then((value){
      setState((){
        a=value;
        passname=a['name'];
        passphone=a['number'];
        passplate=a['numberplate'];
        print(a['name']);
      });
    });

  }
}