import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${DateTime.now().day.toString()} ${DateTime.now().month.toString()} ${DateTime.now().year.toString()}",
        ),
        centerTitle: true,
      ),
    );
  }
}
