import 'package:flutter/material.dart';

void main() {
  runApp(const MKSTATIONARY());
}

class MKSTATIONARY extends StatelessWidget {
  const MKSTATIONARY({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MK STATIONARY',

      home: const Text('MK STATIONARY Home Page'),
    );
  }
}
