import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  final String title;

  DummyScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title Screen',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
