import 'package:flutter/material.dart';

class PinContainer extends StatelessWidget {

  final List<TextEditingController> controllers;

  PinContainer({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: "",
            ),
          ),
        ),
      ),
    );
  }
}