import 'package:flutter/material.dart';

class NavLink extends StatelessWidget {
  final String label;
  final String routeName;

  const NavLink({super.key, required this.label, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.yellowAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
