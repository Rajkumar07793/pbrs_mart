import 'package:flutter/material.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('My Cart')),
      body: Center(
        child: Text(
          'Coming Soon...',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
