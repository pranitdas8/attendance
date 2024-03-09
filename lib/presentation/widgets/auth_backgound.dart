import 'package:flutter/material.dart';

class AuthBackgroundScaffold extends StatelessWidget {
  final Widget child;
  AuthBackgroundScaffold({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25), child: child),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffCEA2FB), Color(0xff87ADFB)])),
      ),
    );
  }
}
