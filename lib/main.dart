import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/ui/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Bloc App',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.teal)),
    );
  }
}
