import 'package:flutter/material.dart';
import 'package:flutter_practice32_hw4/screens/home_screen.dart';
import 'package:flutter_practice32_hw4/screens/long_break_screen.dart';
import 'package:flutter_practice32_hw4/screens/short_break_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ShortBreakScreen.id: (context) => ShortBreakScreen(),
        LongBreakScreen.id: (context) => LongBreakScreen(),
      },
    );
  }
}



