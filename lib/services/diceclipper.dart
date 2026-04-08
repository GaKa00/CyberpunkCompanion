import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiceClipper extends CustomClipper<Path> {
  final int sides;

  DiceClipper(this.sides);

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    double angle = (2 * math.pi) / sides;

    double startAngle = sides % 2 == 0 ? (math.pi / sides) : -math.pi / 2;

    path.moveTo(
      center.dx + radius * math.cos(startAngle),
      center.dy + radius * math.sin(startAngle),
    );

    for (int i = 1; i <= sides; i++) {
      path.lineTo(
        center.dx + radius * math.cos(startAngle + i * angle),
        center.dy + radius * math.sin(startAngle + i * angle),
      );
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CyberDice extends StatefulWidget {
  final int diceSize;
  final String label;
  final Color themeColor;

  const CyberDice({
    super.key,
    required this.diceSize,
    required this.label,
    required this.themeColor,
  });

  @override
  State<CyberDice> createState() => _CyberDiceState();
}

class _CyberDiceState extends State<CyberDice> {
  // This variable holds the "Reactible" state
  int _currentValue = 0;

  void _roll() {
    setState(() {
      // Logic: Random 1 to diceSize
      _currentValue = math.Random().nextInt(widget.diceSize) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine shape sides based on dice type
    int sides = 4;
    double widthFactor = 1.0;

    switch (widget.diceSize) {
      case 4:
        sides = 3;
        break;
      case 6:
        sides = 4;
        break;
      case 12:
        sides = 5;
        break;
      case 20:
        sides = 8;
        break;
      case 10:
        widthFactor = 1.4;
        break; // Wide diamond
    }

    return GestureDetector(
      onTap: _roll, // Trigger the roll on tap
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Border/Glow
          ClipPath(
            clipper: DiceClipper(sides),
            child: Container(
              width: 74 * widthFactor,
              height: 74,
              color: widget.themeColor,
            ),
          ),
          // Inner Face
          ClipPath(
            clipper: DiceClipper(sides),
            child: Container(
              width: 70 * widthFactor,
              height: 70,
              color: Colors.black,
              child: Center(
                child: Text(
                  // Display result if rolled, otherwise the dice name
                  _currentValue == 0 ? "D${widget.diceSize}" : "$_currentValue",
                  style: TextStyle(
                    color: widget.themeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Text(
            widget.label,
            style: TextStyle(
              color: widget.themeColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
