import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  final emailController = TextEditingController();
  final passwordController = TextEditingController(); // Add text controllers

  void signUserOut(BuildContext context) {
    // Clear the text controllers
    emailController.clear();
    passwordController.clear();

    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              signUserOut(context);
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'welcome ${user.email!}',
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
