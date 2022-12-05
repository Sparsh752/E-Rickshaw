import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late String _email;
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
              height: 40,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 230,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                     await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _email);
                     Fluttertoast.showToast(
                         msg: "Sent reset link successfully. The link might be in your spam folder"
                     );
                     if(!mounted) return;
                     Navigator.pop(context);
                  } on FirebaseAuthException catch (error) {
                    switch (error.code) {
                      case "user-not-found":
                        errormsg = "User with this email is not found";
                        break;
                      default:
                        errormsg = "Undefined error occured";
                    }
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('$errormsg')));
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
                  "Send reset link",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              indent: 30,
              endIndent: 30,
              thickness: 0.4,
              color: Color.fromRGBO(81, 99, 101, 1.0),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(" Back to login.",
                      style: TextStyle(
                        color: Color.fromRGBO(238, 107, 97, 1.0),
                        fontSize: 16,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
