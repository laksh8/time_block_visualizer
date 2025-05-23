import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}",
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 24,
        itemBuilder: (BuildContext context, int index) {
          String timeString;

          if (index < 9) {
            timeString = "0$index:00 - 0${index + 1}:00";
          } else if (index == 9) {
            timeString = "0$index:00 - ${index + 1}:00";
          } else {
            timeString = "$index:00 - ${index + 1}:00";
          }

          return Timeblock(timeString: timeString);
        },
      ),
    );
  }
}

class Timeblock extends StatelessWidget {
  const Timeblock({super.key, required this.timeString});

  final String timeString;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: BorderDirectional(top: BorderSide())),
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(alignment: Alignment.bottomRight, child: Text(timeString)),
      ),
    );
  }
}
