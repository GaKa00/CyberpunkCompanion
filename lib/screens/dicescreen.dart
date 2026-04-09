import 'package:cptcgc/widgets/dicerow.dart';
import 'package:cptcgc/widgets/navlink.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceScreen());
}

class DiceScreen extends StatelessWidget {
  const DiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Text(
          'Dice Roller',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(child: DiceGrid()),
    );
  }
}
