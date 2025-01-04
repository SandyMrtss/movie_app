// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_app/screens/main.dart';

void main() {
  runApp(const MyApp());
}
enum MediaType {movie,tv,actor}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF242A32),
      ),
    );
    return GetMaterialApp(
      title: 'TMDB App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF242A32),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(186, 0, 0, 100),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: Main(),
    );
  }
}