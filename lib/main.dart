import 'package:flutter/material.dart';
import 'package:graficos/UI/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Graficos en Flutter',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 83, 17, 198),
        ),
      ),
      home: const HomeView(),
    );
  }
}
