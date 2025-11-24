import 'package:flutter/material.dart';

class CarePage extends StatelessWidget {
  const CarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Care")),
      body: const Center(child: Text("Care Page")),
    );
  }
}