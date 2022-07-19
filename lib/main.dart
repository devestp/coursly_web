import 'package:flutter/material.dart';

import 'home.dart';
import 'theme/theme.dart';

void main() {
  runApp(const Coursly());
}

class Coursly extends StatelessWidget {
  const Coursly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: theme,
    );
  }
}