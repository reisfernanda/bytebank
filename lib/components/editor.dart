import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  const Editor(
      {super.key,
      required this.controller,
      required this.rotulo,
      required this.dica,
      this.icone});

  final TextEditingController controller;
  final String rotulo;
  final String dica;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            labelText: rotulo,
            hintText: dica,
            icon: icone != null ? Icon(icone) : null),
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}
