import 'package:flutter/material.dart';

class Camara extends StatelessWidget {
  const Camara({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            color: Colors.black,
            alignment: Alignment.center,
            child: const Text(
              'Pantalla de Cámara',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),

          const SizedBox(height: 20),

          Container(
            margin: const EdgeInsets.only(top: 40),
            height: 175,
            width: 300,
            decoration: _cardDecoration(),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Instrucciones',
                    style: TextStyle(
                      color: Color(0xFF0F7B3E),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "1. Coloca el residuo frente a la cámara.\n2. Asegúrate de que el objeto esté completo dentro del marco.\n3. Mantén buena iluminación y evita sombras.\n4. Mantén el dispositivo estable.\n5. Presiona el botón para escanear.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: const Color.fromARGB(255, 203, 255, 207),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(30),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
