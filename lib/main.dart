import 'package:flutter/material.dart';
import '../screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management System Dashboard',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      home: const LoginScreen(),
      routes: {
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
