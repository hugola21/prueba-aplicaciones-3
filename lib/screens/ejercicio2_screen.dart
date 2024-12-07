import 'package:flutter/material.dart';

class Exercise2Screen extends StatefulWidget {
  @override
  _Exercise2ScreenState createState() => _Exercise2ScreenState();
}

class _Exercise2ScreenState extends State<Exercise2Screen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  double? _pressure;

  static const double density = 1025; 
  static const double gravity = 9.8;  

  void _calculatePressure() {
    if (_formKey.currentState!.validate()) {
      final height = double.parse(_heightController.text);
      setState(() {
        _pressure = density * gravity * height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 2: Presión Submarina'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Altura (m)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la altura';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculatePressure,
                child: Text('Calcular Presión'),
              ),
              SizedBox(height: 20),
              if (_pressure != null)
                Text(
                  'Presión Calculada: ${_pressure!.toStringAsFixed(2)} Pa',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
