import 'package:flutter/material.dart';
import 'oauth_webview.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

// Make the State class public (remove the leading underscore)
class LoginPageState extends State<LoginPage> {
  String? token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
        child: token == null
            ? ElevatedButton(
                onPressed: () => _loginWithOAuth(context),
                child: const Text("Login with Google"),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 64),
                  const SizedBox(height: 16),
                  Text("Logged in! Token:\n$token", textAlign: TextAlign.center),
                ],
              ),
      ),
    );
  }

  void _loginWithOAuth(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OAuthWebView()),
    );

    if (result != null && result is String) {
      setState(() {
        token = result;
      });
    }
  }
}
