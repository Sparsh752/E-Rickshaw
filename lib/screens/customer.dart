import 'package:erickshaw/screens/emailVerification.dart';
import 'package:erickshaw/screens/emailVerification_passenger.dart';
import 'package:erickshaw/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../database.dart';




class customer_login extends StatefulWidget {
  const customer_login({Key? key}) : super(key: key);

  @override
  State<customer_login> createState() => _customer_loginState();
}

class _customer_loginState extends State<customer_login> {
  late Databases db;
  initialise() {
    db = Databases();
    db.initialise();
  }
  late String _uid;
  void initState(){
    super.initState();
    initialise();
    // _uid=auth.currentUser?.uid.toString()??"";
  }
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _confirmpassword = TextEditingController();
  final _number = TextEditingController();
  final auth = FirebaseAuth.instance;
  String? errormsg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 242, 221, 1),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(
              height: 120,
            ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: 50,
          width: 280,
          // color: Colors.grey,
          decoration: BoxDecoration(
              color: Color.fromRGBO(189, 215, 214, 1.0),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: Color.fromRGBO(127, 157, 156, 1.0),
              )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _name.text = value.trim();
                });},
              decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(81, 99, 101, 1.0)),
                  border: InputBorder.none),
            ),
          ),
        ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 50,
              width: 280,
              // color: Colors.grey,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(189, 215, 214, 1.0),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: Color.fromRGBO(127, 157, 156, 1.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      _number.text=value.trim();
                    });},
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(81, 99, 101, 1.0)),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 50,
              width: 280,
              // color: Colors.grey,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(189, 215, 214, 1.0),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: Color.fromRGBO(127, 157, 156, 1.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      _email.text = value.trim();
                    });},
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(81, 99, 101, 1.0)),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 50,
              width: 280,
              // color: Colors.grey,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(189, 215, 214, 1.0),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: Color.fromRGBO(127, 157, 156, 1.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password.text = value.trim();
                    });},
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(81, 99, 101, 1.0)),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 50,
              width: 280,
              // color: Colors.grey,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(189, 215, 214, 1.0),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: Color.fromRGBO(127, 157, 156, 1.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _confirmpassword.text = value.trim();
                    });},
                  decoration: InputDecoration(
                      hintText: 'Confirm password',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(81, 99, 101, 1.0)),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 230,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {

                    if(_name.text.isEmpty){
                      errormsg= "Name can't be empty";

                    }else if(_number.text.isEmpty){
                      errormsg= "Number can't be empty";
                    }else if(_email.text.isEmpty){
                      errormsg= "Email can't be empty";
                    }else if(_password.text.isEmpty){
                      errormsg = "Password can't be empty";
                    }else if(_confirmpassword.text.isEmpty){
                      errormsg= "Confirm Password can't be empty";
                    }else if(_confirmpassword.text!=_password.text){
                      errormsg= "Password doesn't match";
                    }else if(_number.text.length!=10){
                      errormsg= "Number is of wrong format";
                    }else{
                      errormsg= "";
                    }
                    if(errormsg==""){
                      try {
                        await auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text);
                        auth.signInWithEmailAndPassword(email: _email.text, password: _password.text);
                        _uid=auth.currentUser?.uid.toString()??"";
                        db.create_passenger(_name.text,_uid,_number.text,_email.text);
                        // auth.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailVerification_Passenger()));
                      } on FirebaseAuthException catch(error){
                        print(error.code);
                        Fluttertoast.showToast(msg: error.code, toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIosWeb: 1);
                      }

                    }else{
                      print(errormsg);
                      Fluttertoast.showToast(msg: errormsg!, toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,timeInSecForIosWeb: 1);
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hello')));
                    }



                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          // side: BorderSide(color: Colors.red)
                        )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(238, 107, 97, 1.0)),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 0.4,
              color: Color.fromRGBO(81, 99, 101, 1.0),
              indent:30,
              endIndent: 30,
            ),
            
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                  style: TextStyle(
                      color: Color.fromRGBO(81, 99, 101, 1.0),
                      fontSize: 16
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(" Sign in.",
                      style: TextStyle(
                        color: Color.fromRGBO(238, 107, 97, 1.0),
                        fontSize: 16,)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




