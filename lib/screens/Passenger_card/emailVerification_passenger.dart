import 'dart:async';

import 'package:erickshaw/screens/Passenger_card/Route_select.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class EmailVerification_Passenger extends StatefulWidget {
  const EmailVerification_Passenger({Key? key}) : super(key: key);

  @override
  State<EmailVerification_Passenger> createState() => _EmailVerification_PassengerState();
}

class _EmailVerification_PassengerState extends State<EmailVerification_Passenger> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
      sendVerificationEmail();
      timer=Timer.periodic(const Duration(seconds: 2), (timer) {
        checkEmailVerified();
      });
    }
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  Future checkEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user!.reload();
    if (user.emailVerified) {
      timer?.cancel();
      // FirebaseAuth.instance.signOut();
      setState(() {
        isEmailVerified = true;
      });
    }
  }
  Future sendVerificationEmail() async {
    try{
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();}
    catch(e){
      SnackBar snackBar = const SnackBar(content: Text("Too many request. Please Wait."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  @override
  Widget build(BuildContext context)=> isEmailVerified ? const SelectRoute() : Scaffold(

      backgroundColor: Color.fromRGBO(239, 242, 221, 1),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              sendVerificationEmail();
            },
            child: const Text('Send Email again',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: BorderSide(color: Colors.red)
                  )),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(238, 107, 97, 1.0)),
            ),
          ),
          const SizedBox(height: 20,),
          const Text('Check your email for verification link',
              style: TextStyle(
                color: Color.fromRGBO(238, 107, 97, 1.0),
                fontSize: 16,
              )),
          const Text('Also check spam folder if you can\'t find it',
              style: TextStyle(
                color: Color.fromRGBO(238, 107, 97, 1.0),
                fontSize: 16,
              )),
        ],
      ),)
  );
}
