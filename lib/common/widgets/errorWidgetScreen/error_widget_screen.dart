import 'package:flutter/material.dart';

class ErrorWidgetScreen extends StatelessWidget {
  const ErrorWidgetScreen({super.key, this.routeName});

  final String? routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("No Route Found $routeName"),
      ),
    );
  }
}