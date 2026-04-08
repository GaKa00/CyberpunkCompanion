import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApp(),
        '/dice': (context) => const DiceScreen(),
        '/deck': (context) => const DeckBuilder(),
        '/rules': (context) => const RulesScreen(),
        '/cards': (context) => const CardDatabase(),
        '/ai': (context) => const AICompanion(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Cyberpunk TCG',
      home: Scaffold(
        backgroundColor: Colors.black, // Cyberpunk vibes
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent, // Classic cyberpunk contrast
          title: const Text(
            'Cyberpunk TCG Companion',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Center(
          child: Text(
            'System Online: Hello, World!',
            style: TextStyle(color: Colors.cyanAccent, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
