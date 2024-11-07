import 'package:flutter/material.dart';
import 'package:test1/pages/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        listTileTheme: ListTileThemeData(
          iconColor: Colors.grey.shade700
        ),
          appBarTheme: AppBarTheme(
            color: Colors.blue,
            iconTheme: IconThemeData(color: Colors.white),
            foregroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue),
          ),
      home: Homescreen(),
    );
  }
}
