import 'package:flutter/material.dart';
import 'package:revida/Pages/Data/object.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late List<Object> _objects;

  @override
  void initState() {
    super.initState();
    _objects = List<Object>.generate(2, (index) {
      return Object(
        name: 'Objeto ${index + 1}',
        description: 'Descripción del objeto ${index + 1}',
        message: 'Mensaje del objeto ${index + 1}',
        date: '2024-0${index + 1}-01',
        category: 'Categoría A',
        imageUrl: 'https://via.placeholder.com/150',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: _objects.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_objects[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_objects[index].category),
                  Text(
                    _objects[index].date,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  _objects[index].imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: Icon(Icons.no_photography, color: Color(0xFFC0FFB3)),
                  ),
                ),
              ),
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => buildSheet(_objects[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildSheet(Object objeto) => Container(
    padding: EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              objeto.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.no_photography,
                    size: 60,
                    color: Colors.grey[600],
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Imprimir Detalles'),
            ),
          ),
          Text(
            'Detalles del Objeto',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Descripción: ${objeto.description}'),
          SizedBox(height: 5),
          Text('Mensaje: ${objeto.message}'),
          SizedBox(height: 5),
          Text('Fecha: ${objeto.date}'),
          SizedBox(height: 5),
          Text('Categoría: ${objeto.category}'),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ),
        ],
      ),
    ),
  );
}
