import 'package:flutter/material.dart';

class Camara extends StatelessWidget {
  const Camara({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // 🔲 Simulación de vista previa de cámara
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.55,
                  color: Colors.black,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          'Vista previa de cámara',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),

                        // 🟢 Marco verde de detección
                        Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF0F7B3E),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 📘 Tarjeta de instrucciones
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: _cardDecoration(),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
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
                        "1. Coloca el residuo frente a la cámara.\n"
                        "2. Asegúrate de que esté dentro del marco.\n"
                        "3. Mantén buena iluminación.\n"
                        "4. Evita sombras.\n"
                        "5. Presiona el botón para escanear.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // 🔘 Botón flotante de escaneo
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: FloatingActionButton(
                  onPressed: () {
                  },
                  backgroundColor: const Color(0xFF0F7B3E),
                  child: const Icon(Icons.camera_alt),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: const Color(0xFFE6FFE9),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
