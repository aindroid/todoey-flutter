import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/clima/screens/city_screen.dart';
import 'package:todoey_flutter/clima/screens/loading_screen.dart';
import 'package:todoey_flutter/firebase_options.dart';
import 'package:todoey_flutter/flash_chat/screens/chat_screen.dart';
import 'package:todoey_flutter/flash_chat/screens/welcome_screen.dart';
import 'package:todoey_flutter/passkeys/credentials_screen.dart';
import 'package:todoey_flutter/todoey/screens/task_screen.dart';

import 'flash_chat/screens/login_screen.dart';
import 'flash_chat/screens/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // name: 'flash-chat-66f55',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            'Flutter apps',
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Builder(builder: (context) {
            return ListView(
              children: [
                getListItem(context, 'Todoey', '/todoey'),
                getListItem(context, 'Flash Chat', '/flash-chat'),
                getListItem(context, 'Clima', '/clima'),
                getListItem(context, 'Passkeys', '/credentials'),
              ],
            );
          }),
        ),
      ),
      routes: {
        '/todoey': (context) => const TaskScreen(),
        '/flash-chat': (context) => const AuthenticationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        '/clima': (context) => const ClimaLoadingScreen(),
        '/city': (context) => const CityScreen(),
        '/credentials': (context) => const CredentialsScreen(),
      },
    );
  }

  Widget getListItem(BuildContext context, String name, String routeName) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.amber,
          textStyle: const TextStyle(fontSize: 20),
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
