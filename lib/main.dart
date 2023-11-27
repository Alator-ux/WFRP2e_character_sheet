import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_web/widgets/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // textTheme: GoogleFonts.latoTextTheme(
        //   const TextTheme(
        //     titleMedium: TextStyle(
        //         color: Color.fromARGB(255, 255, 255, 255),
        //         fontSize: 18,
        //         letterSpacing: 1.0,
        //         fontFamily: 'Helvetica'),
        //     bodyMedium: TextStyle(fontSize: 14.0, letterSpacing: 1.0),
        //     bodySmall: TextStyle(fontSize: 10.0, letterSpacing: 0.8),
        //     labelSmall: TextStyle(fontSize: 9.0, letterSpacing: 0.6),
        //   ),
        // ),
      ),
      home: const MainPage(),
    );
  }
}
