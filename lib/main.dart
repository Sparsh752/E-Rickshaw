import 'package:erickshaw/screens/driversign.dart';
import 'package:erickshaw/screens/landingpage.dart';
import 'package:erickshaw/screens/login.dart';
import 'package:erickshaw/screens/login_driver.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/customer.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);

  runApp(const MaterialApp(


    home: Landing(),
  ));
}
