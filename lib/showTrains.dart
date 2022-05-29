import 'package:flutter/material.dart';

class TrainList extends StatelessWidget {
  const TrainList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 130,
        width: 1000,
        child: Column(
          children: [
            Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('12904'),
                        SizedBox(width: 10),
                        Text('Pandiyan Express'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('MDU'),
                            Text('12:00'),
                            Text('Sun,29 May'),
                          ],
                        ),
                        Icon(Icons.arrow_forward),
                        Column(
                          children: [
                            Text('MDU'),
                            Text('12:00'),
                            Text('Sun,29 May'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
