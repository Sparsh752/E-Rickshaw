import 'package:erickshaw/screens/driversign.dart';
import 'package:erickshaw/screens/login.dart';
import 'package:erickshaw/screens/login_driver.dart';
import 'package:flutter/material.dart';

class UserChoice extends StatelessWidget {
  const UserChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 242, 221, 1),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Driver()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(238, 107, 97, 1.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red))),
                    ),
                    child: Text(
                      'Driver',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 230,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(238, 107, 97, 1.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red))),
                    ),
                    child: Text(
                      'Passenger',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
