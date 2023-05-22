import 'package:flutter/material.dart';
import 'package:wallpaperapp/views/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      //theme: ThemeData(primaryColor: Colors.white),
      home: const Home(),
    );
  }
}
