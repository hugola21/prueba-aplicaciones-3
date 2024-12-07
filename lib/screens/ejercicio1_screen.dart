import 'package:flutter/material.dart';

class Exercise1Screen extends StatefulWidget {
  @override
  _Exercise1ScreenState createState() => _Exercise1ScreenState();
}

class _Exercise1ScreenState extends State<Exercise1Screen> {
  final _formKey = GlobalKey<FormState>();
  final _initialSpeedController = TextEditingController();
  final _finalSpeedController = TextEditingController();
  String _result = '';

  void _calculateTime() {
    if (_formKey.currentState!.validate()) {
      final initialSpeed = double.parse(_initialSpeedController.text);
      final finalSpeed = double.parse(_finalSpeedController.text);
      const acceleration = 10.0; 
      final time = (finalSpeed - initialSpeed) / acceleration;

      setState(() {
        _result = time <= 10
            ? 'El vehículo aprueba la prueba con un tiempo de ${time.toStringAsFixed(2)} segundos.'
            : 'El vehículo no aprueba. Tiempo: ${time.toStringAsFixed(2)} segundos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 1: Pista de Autos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _initialSpeedController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Velocidad Inicial (m/s)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la velocidad inicial';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _finalSpeedController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Velocidad Final (m/s)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la velocidad final';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateTime,
                child: Text('Calcular Tiempo'),
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Text(
                  _result,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
