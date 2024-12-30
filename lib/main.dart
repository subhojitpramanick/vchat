import 'package:flutter/material.dart';
import 'package:vchat/firebase_options.dart';
import 'CallScreen.dart';
import 'ChatScreen.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  // const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vchat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Routes Description
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/chat': (context) => ChatScreen(),
        '/call': (context) => CallScreen(),
      },
    );
  }
}
