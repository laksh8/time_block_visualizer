import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double timeBlockHeight = MediaQuery.of(context).size.height / 6;
    TimeOfDay now = TimeOfDay.now();
    double topOffset =
        now.hour * timeBlockHeight + (now.minute / 60) * timeBlockHeight;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // to make the scroll handle by the single chil scroll view

              itemCount: 24,
              itemBuilder: (BuildContext context, int index) {
                String timeString;
                String timeBlockEnd;

                if (index < 9) {
                  timeBlockEnd = "0${index + 1}:00";
                } else {
                  timeBlockEnd = "${index + 1}:00";
                }

                if (index < 9) {
                  timeString = "0$index:00 - 0${index + 1}:00";
                } else if (index == 9) {
                  timeString = "0$index:00 - ${index + 1}:00";
                } else {
                  timeString = "$index:00 - ${index + 1}:00";
                }

                return Timeblock(
                  timeString: timeString,
                  timeBlockEnd: timeBlockEnd,
                );
              },
            ),

            Positioned(
              top: topOffset,
              left: 0,
              right: 0,
              child: Container(height: 2, color: Colors.red),
            ),
            Positioned(
              top: topOffset,
              left: 8,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Now", style: TextStyle(color: Colors.red)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Timeblock extends StatelessWidget {
  const Timeblock({
    super.key,
    required this.timeString,
    required this.timeBlockEnd,
  });

  final String timeString;
  final String timeBlockEnd;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(timeString);
      },
      child: Container(
        decoration: BoxDecoration(border: BorderDirectional(top: BorderSide())),
        height: MediaQuery.of(context).size.height / 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(timeBlockEnd),
          ),
        ),
      ),
    );
  }
}
