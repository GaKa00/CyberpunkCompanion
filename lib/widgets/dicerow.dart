import 'package:cptcgc/services/diceclipper.dart';
import 'package:flutter/material.dart';

class DiceGrid extends StatelessWidget {
  const DiceGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // YELLOW ROW
          buildDiceRow(Colors.yellowAccent),
          const SizedBox(height: 40), // Space between rows
          // RED ROW
          buildDiceRow(Colors.redAccent),
        ],
      ),
    );
  }
}

Widget buildDiceRow(Color color) {
  return SingleChildScrollView(
    // Allows scrolling if they don't fit
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CyberDice(diceSize: 4, label: "D4", themeColor: color),
        const SizedBox(width: 10),
        CyberDice(diceSize: 6, label: "D6", themeColor: color),
        const SizedBox(width: 10),
        CyberDice(diceSize: 8, label: "D8", themeColor: color),
        const SizedBox(width: 10),
        CyberDice(diceSize: 10, label: "D10", themeColor: color),
        const SizedBox(width: 10),
        CyberDice(diceSize: 12, label: "D12", themeColor: color),
        const SizedBox(width: 10),
        CyberDice(diceSize: 20, label: "D20", themeColor: color),
      ],
    ),
  );
}
