import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hugo Lema',
                    style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: 18),
                  ),
                  Text(
                    'GitHub: hugola21',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Ejercicio 1: Pista de Autos'),
              onTap: () {
                Navigator.pushNamed(context, '/ejercicio1');
              },
            ),
            ListTile(
              title: Text('Ejercicio 2: Presión Submarina'),
              onTap: () {
                Navigator.pushNamed(context, '/ejercicio2');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
        
          Positioned.fill(
            child: Image.asset(
              'assets/images/fondo.jpg',  
              fit: BoxFit.cover,            
            ),
          ),
          
          Center(
            child: Text(
              'Hugo Lema-Git:hugola21',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,  
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
