import 'package:anatome/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Anatome());
}

class Anatome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anatome',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home:SplashScreen(),

    );
  }
}
