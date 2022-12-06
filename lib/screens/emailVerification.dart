import 'dart:async';

import 'package:erickshaw/screens/login_driver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
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
      FirebaseAuth.instance.signOut();
      setState(() {
        isEmailVerified = true;
      });
    }
  }
  Future sendVerificationEmail() async {
    try{
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();}
    catch(e){
      SnackBar snackBar = const SnackBar(content: Text("Error"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  @override
  Widget build(BuildContext context)=> isEmailVerified ? const Login_Driver() : Scaffold(
   appBar: AppBar(
     title: const Text('Email Verification'),
   ),
  body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: (){
            sendVerificationEmail();
          },
          child: const Text('Send Email again'),
        ),
        const Text('Check your email for verification link'),
        const Text('Also check spam folder if you can\'t find it'),
      ],
    )
  );
}
