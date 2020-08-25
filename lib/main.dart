import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tracko/app/landing_page.dart';
import 'package:tracko/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracko',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
