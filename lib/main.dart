import 'package:flutter/material.dart';
import 'oauth_webview.dart';
import 'login_page.dart'; // Make sure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OAuth Demo',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // Main page is the login page
    );
  }
}
