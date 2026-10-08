import 'package:flutter/material.dart';
import 'package:jadwalku/Login.dart';
import 'package:jadwalku/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "/": (context) => const Login(),
        "/home": (context) => const MyHomePage(),
      },
    );
  }
}