import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signin_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YA ALLAH',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyLoginPage(),
    );
  }
}


// git add .                       //to track all changes
//git commit -m "your message"     // to give identity you changes
//git push -u origin master        // to push the code on master branch