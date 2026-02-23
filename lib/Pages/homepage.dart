import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              //Logo
              Center(
                child: Image.asset(
                  'img/logo.jpeg',
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ),

              const SizedBox(height: 10),

              // REVIDA
              const Text(
                'REVIDA',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F7B3E),
                ),
              ),

              const SizedBox(height: 30),

              // Primera fila con 2 cajas
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Estadísticas 
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 220,
                      decoration: _cardDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Estadísticas",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 15),
                          Icon(Icons.pie_chart, size: 60, color: Color(0xFF11C95A)),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Residuos
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 180,
                      padding: const EdgeInsets.all(16.0),
                      decoration: _cardDecoration(),
                      child: const Center(
                        child: Text(
                          "Residuos Reciclados\n2026 residuos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Último Escaneo
              Container(
                height: 120,
                width: double.infinity,
                decoration: _cardDecoration(),
                child: const Center(
                  child: Text(
                    "Último Escaneo\nEscaneaste un coso raro",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
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
        )
      ],
    );
  }
}