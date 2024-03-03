// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Components/TextFields.dart';
import 'package:myapp/Components/button.dart';
import 'package:myapp/Components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn(BuildContext context) async {
    try {
      //showing dialog loading circle
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            ),
          );
        },
      );
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Delay closing the dialog for a short moment
      await Future.delayed(Duration(seconds: 1));

      //pop the dialog
      Navigator.of(context).pop();

      // If sign-in is successful, navigate to the home page
      Navigator.of(context).pushNamed('/home');
    } catch (e) {
      // Handle sign-in errors here
      print('Sign-in error: $e');

      // You can display an error message to the user if needed
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(12, 14, 12, 10),
            title: Text(
              'Sign-in Error',
              style: GoogleFonts.roboto(color: Colors.amber.shade400),
            ),
            content: Text(
              'An error occurred during sign-in. Please enter the correct email and password.',
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 15),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: GoogleFonts.roboto(
                      color: Colors.amber.shade400, fontSize: 15),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          //the image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('images/akram-huseyn-f3nGngsnp3A-unsplash.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Apply a BackdropFilter with a blur effect to the background
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 4, sigmaY: 4), // Adjust blur values as needed
            child: Container(
              color: Colors.black.withOpacity(0), // Adjust opacity as needed
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                height: 500,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),

                //some text

                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Welcome back',
                        style: GoogleFonts.roboto(
                          color: Colors.amberAccent.shade400,
                          fontSize: 35,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      // email textfield
                      MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),

                      SizedBox(height: 5),
                      // password textfield
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      // forgot password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: GoogleFonts.roboto(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      // sign in button
                      MyButton(
                        onTap: () {
                          signUserIn(context);
                        },
                      ),
                      //or continue with
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 0.5,
                              color: Colors.black26,
                            )),
                            //or continue with
                            Text('Or continue with',
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  color: Colors.amberAccent.shade400,
                                )),
                            Expanded(
                                child: Divider(
                              thickness: 0.5,
                              color: Colors.black26,
                            ))
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //google and apple sign in buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //google button
                          SquareTile(imagePath: 'images/google.png'),

                          SizedBox(width: 25),

                          //apple button
                          SquareTile(imagePath: 'images/apple.png')
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //not a member? join us babe
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              'Not a member? ',
                              style: GoogleFonts.roboto(fontSize: 15),
                            ),
                          ),
                          Text('Join us now',
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
