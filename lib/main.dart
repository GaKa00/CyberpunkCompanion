import 'package:cptcgc/screens/dicescreen.dart';
import 'package:cptcgc/widgets/navlink.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/dice': (context) => const DiceScreen(),
        // '/deck': (context) => const DeckBuilder(),
        // '/rules': (context) => const RulesScreen(),
        // '/cards': (context) => const CardDatabase(),
        // '/ai': (context) => const AICompanion(),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavLink(label: "Dice Roller", routeName: '/dice'),
              NavLink(label: "Card Database", routeName: '/cards'),
              NavLink(label: "Deck Builder", routeName: '/deck'),
              NavLink(label: "Rules Reference", routeName: '/rules'),
              NavLink(label: "AI Companion", routeName: '/ai'),
            ],
          ),
        ),
      ),
    );
  }
}
