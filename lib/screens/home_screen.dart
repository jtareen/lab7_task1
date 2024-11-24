import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LAB 7 Task 1'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}