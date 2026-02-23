import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                  width: MediaQuery.of(context).size.width * 0.30,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'REVIDA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F7B3E),
                ),
              ),

              const SizedBox(height: 30),

              //Caja principal
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: _cardDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _profileField(
                      titulo: "Usuario:",
                      valor: "Papas",
                    ),
                    const SizedBox(height: 20),

                    _profileField(
                      titulo: "Contraseña:",
                      valor: "ContraseñaDePapas",
                    ),
                    const SizedBox(height: 20),

                    _profileField(
                      titulo: "Correo:",
                      valor: "Papas@uanl.edu.mx",
                    ),

                    const SizedBox(height: 35),

                    //Cerrar sesión
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 201, 18, 18),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Cerrar sesión",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Widget reutilizable para cada campo
  static Widget _profileField({
    required String titulo,
    required String valor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            valor,
            style: const TextStyle(fontSize: 14),
          ),
        ),

        const SizedBox(height: 8),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Cambiar",
              style: TextStyle(
                color: Color(0xFF11C95A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(20),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}