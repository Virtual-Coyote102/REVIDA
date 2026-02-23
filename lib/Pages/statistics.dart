import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();

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

class _StatisticsState extends State<Statistics> {
  Options _currentOption = Options.option1;
  List<bool> recicladoDias = List.generate(
    28,
    (index) => index % 3 == 0, // solo para simular
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Selector
              SingleChoice(
                onChanged: (option) {
                  setState(() {
                    _currentOption = option;
                  });
                },
              ),

              const SizedBox(height: 30),

              // 🔹 Primer contenedor
              Container(
                height: 300,
                width: double.infinity,
                decoration: Statistics._cardDecoration(),
                child: Center(
                  child: _currentOption == Options.option1
                      ? const Icon(
                          Icons.pie_chart,
                          size: 120,
                          color: Color(0xFF11C95A),
                        )
                      : const Icon(
                          Icons.bar_chart,
                          size: 120,
                          color: Color(0xFF11C95A),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Segundo contenedor
              Container(
                height: 180,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: Statistics._cardDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Estadísticas Generales",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),

                    Text("♻ Total de residuos reciclados: 128"),
                    Text("🗓 Reciclajes esta semana: 23"),
                    Text("🏆 Tipo más reciclado: Plástico"),
                    Text("🌎 CO₂ evitado: 14.6 kg"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Tercer contenedor
              Container(
                height: 400,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: Statistics._cardDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Actividad del Mes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Expanded(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 28,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              childAspectRatio: 1,
                            ),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: recicladoDias[index]
                                        ? const Color(0xFF11C95A)
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Options { option1, option2 }

class SingleChoice extends StatefulWidget {
  final ValueChanged<Options> onChanged;

  const SingleChoice({super.key, required this.onChanged});

  @override
  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Options? _selectedOption = Options.option1;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Options>(
      style: SegmentedButton.styleFrom(
        backgroundColor: Colors.white,
        selectedBackgroundColor: Color(0xFF11C95A),
        selectedForegroundColor: Colors.white,
      ),
      segments: const <ButtonSegment<Options>>[
        ButtonSegment<Options>(
          value: Options.option1,
          label: Text('Gráfica de pastel'),
        ),
        ButtonSegment<Options>(
          value: Options.option2,
          label: Text('Gráfica de barras'),
        ),
      ],
      selected: <Options>{_selectedOption!},
      onSelectionChanged: (Set<Options> newSelection) {
        setState(() {
          _selectedOption = newSelection.first;
        });
        widget.onChanged(_selectedOption!);
      },
    );
  }
}
