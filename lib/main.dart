// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/Pages/AuthPage.dart';
import 'package:myapp/Pages/HomePage.dart';
import 'package:myapp/Pages/LoginPage.dart';
import 'package:myapp/Pages/WelcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPage(
              onTap: () {},
            ),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}
