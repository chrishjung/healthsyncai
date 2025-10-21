import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OAuthWebView extends StatefulWidget {
  const OAuthWebView({super.key});

  @override
  OAuthWebViewState createState() => OAuthWebViewState();
}

// make this public
class OAuthWebViewState extends State<OAuthWebView> {
  late final WebViewController controller;

  final String oauthUrl = "http://localhost:3000/auth/google";

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (nav) {
            if (nav.url.startsWith("http://localhost:3000/oauth/callback")) {
              final uri = Uri.parse(nav.url);
              final token = uri.queryParameters['token'];
              Navigator.pop(context, token);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(oauthUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OAuth Login")),
      body: WebViewWidget(controller: controller),
    );
  }
}
