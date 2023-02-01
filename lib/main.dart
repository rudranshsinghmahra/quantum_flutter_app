import 'package:flutter/material.dart';
import 'package:quantum_innovation_flutter_assignment/screens/signIn_signUp_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInSignUpScreen(),
    );
  }
}
