//v0.1.0 Chumma oru gemini vech

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

// --- Linear-Inspired Color Palette ---
const Color linearBlack = Color.fromARGB(255, 41, 41, 46);
const Color linearPrimary = Color.fromARGB(218, 63, 158, 225);
const Color linearGrey = Color.fromARGB(198, 28, 28, 30);
const Color linearBorder = Color(0xFF2B2B2D);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zeroWaste Chef App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: linearBlack,
        primaryColor: linearPrimary,
        // Apply the custom font across the app
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        // Custom styling for specific widgets
        chipTheme: ChipThemeData(
          backgroundColor: linearGrey,
          disabledColor: linearGrey,
          selectedColor: linearPrimary,
          shape: const StadiumBorder(side: BorderSide(color: linearBorder)),
          labelStyle: const TextStyle(color: Colors.white70),
          secondaryLabelStyle: const TextStyle(color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}