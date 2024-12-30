// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'main.dart';

class LoginScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  LoginScreen({super.key});
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign in Canceled')),
        );
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // idToken is not required for sign in
      await _auth.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in Failed')),
      );
    }
  }

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text('Sign in'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      try {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        Navigator.pushReplacementNamed(context, '/home');
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Sign in Failed: $e')),
                        );
                      }
                    },
                    child: Text('Sign in'),
                  ),
                ]));
  }

  Future<void> _registerWithEmailAndPassword(BuildContext context) async {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Register'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    try {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.pushReplacementNamed(context, '/home');
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Register Failed: $e')),
                      );
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LoginPage'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To Vchat',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton.icon(
                    onPressed: () => _signInWithGoogle(context),
                    icon: Icon(Icons.login),
                    label: Text('Sign in with Google'),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ))),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () => _signInWithEmailAndPassword(context),
                  child: Text('Sign in with Email'),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () => _registerWithEmailAndPassword(context),
                  child: Text('Register with Email'),
                ),
              ],
            ),
          ),
        ));
  }
}
