import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';

import '../../screens/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
