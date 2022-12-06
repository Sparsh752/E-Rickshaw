// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:erickshaw/screens/customer.dart';
import 'package:erickshaw/screens/forgot_password.dart';
import 'package:erickshaw/screens/select_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:erickshaw/screens/user_choice_signup.dart';

class ForgotPasswordPage extends StatefulWidget {
  // const ForgotPasswordPage({super.key});
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late String _email;
  late String _password;
  final auth = FirebaseAuth.instance;
  String? errormsg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 242, 221, 1.0),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
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
                      _email = value.trim();
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(81, 99, 101, 1.0)),
                      border: InputBorder.none),
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
                onPressed: () async {
                  try {
                    UserCredential user = await auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectRoute()));
                    }
                  } on FirebaseAuthException catch (error) {
                    switch (error.code) {
                      case "invalid-email":
                        errormsg = "Your email is wrong";
                        break;
                      case "wrong-password":
                        errormsg = "Password entered is wrong";
                        break;
                      case "user-not-found":
                        errormsg = "User with this email is not found";
                        break;
                      case "user-disabled":
                        errormsg = "User is disabled";
                        break;
                      case "too-many-request":
                        errormsg = "Facing too many requests now";
                        break;
                      case "operation-not-allowed":
                        errormsg = "Operation not allowed";
                        break;
                      default:
                        errormsg = "Undefined error occured";
                    }
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('${errormsg}')));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(238, 107, 97, 1.0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          side: BorderSide(color: Colors.red))),
                ),
                child: Text(
                  "Send reset password link",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
              indent: 30,
              endIndent: 30,
              thickness: 0.4,
              color: Color.fromRGBO(81, 99, 101, 1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserChoiceSignUp()));
                  },
                  child: Text("Signup Page",
                      style: TextStyle(
                        color: Color.fromRGBO(238, 107, 97, 1.0),
                        fontSize: 16,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
