import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:revida/Pages/camara.dart';
import 'package:revida/Pages/history.dart';
import 'package:revida/Pages/homepage.dart';
import 'package:revida/Pages/profile.dart';
import 'package:revida/Pages/statistics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  final screens = [
    HomePage(),
    History(),
    Camara(),
    Statistics(),
    Profile(),
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        backgroundColor: Colors.transparent,
        index: 0,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 28, color: Colors.black),
          Icon(Icons.description_outlined, size: 28, color: Colors.black),
          Icon(Icons.camera_alt_outlined, size: 28, color: Colors.black),
          Icon(Icons.show_chart, size: 28, color: Colors.black),
          Icon(Icons.person_outline, size: 28, color: Colors.black),
        ],
        color: Color(0xFF11C95A),
        buttonBackgroundColor: Color(0xFF11C95A),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: screens[index],
    );
  }
}
