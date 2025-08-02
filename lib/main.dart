import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

// --- Linear-Inspired Color Palette ---
const Color linearBlack = Color(0xFF111113);
const Color linearPrimary = Color(0xFF5E5CEE);
const Color linearGrey = Color(0xFF1C1C1E);
const Color linearBorder = Color(0xFF2B2B2D);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero-Waste Chef',
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