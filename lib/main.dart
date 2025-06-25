import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/tabs.dart';

var theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 0, 33, 33),
  ),
);

void main() {
  runApp(ProviderScope(child: myApp()));
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(theme: theme, home: tabscreen());
  }
}
