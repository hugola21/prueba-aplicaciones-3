import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/ejercicio1_screen.dart';
import 'screens/ejercicio2_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación con Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/ejercicio1': (context) => Exercise1Screen(),
        '/ejercicio2': (context) => Exercise2Screen(),
      },
    );
  }
}
