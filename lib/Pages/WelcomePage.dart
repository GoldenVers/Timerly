// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Pages/LoginPage.dart';
import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(31, 255, 255, 255),
        body: Container(
          decoration: BoxDecoration(
              //background image
              image: DecorationImage(
                  image: AssetImage(
                      'images/rocco-stoppoloni-h6qnnmbkLBU-unsplash.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        //filter of the background
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 100.0, left: 20),
                                  child: Text(
                                    'Welcome',
                                    style: GoogleFonts.lobsterTwo(
                                        fontSize: 70,
                                        color: Colors.yellow.shade500,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //we are glad that  you are here
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            'We are glad that you are here, lets manage your time with Timerly',
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: SizedBox(
                            height: 40,
                            width: 135,
                            //get started button
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: Colors.yellow)),
                                    foregroundColor: Colors.yellow),
                                onPressed: () => Navigator.of(context).push(
                                    PageTransition(
                                        child: LoginPage(
                                          onTap: () {},
                                        ),
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        curve: Curves.fastOutSlowIn,
                                        duration: Duration(milliseconds: 700),
                                        reverseDuration:
                                            Duration(milliseconds: 700))),
                                child: Center(
                                  child: Text(
                                    "Join In",
                                    style: GoogleFonts.roboto(
                                      fontSize: 25,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
