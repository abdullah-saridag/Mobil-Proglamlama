import 'package:flutter/material.dart';
import 'package:personal_assistant/screen/giris.dart'; // Giriş ekranı

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kişisel Asistan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: WelcomeScreen(), // Başlangıç ekranı giriş ekranı olarak ayarlandı
    );
  }
}
