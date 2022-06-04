import 'package:flutter/material.dart';

import 'passenger.dart';

class PnrTrainList extends StatelessWidget {
  const PnrTrainList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 800,
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 3,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('PNR Number:'),
                      Text('3457171937'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('87525'), Text('Pandiyan')],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('From : Madurai'), Text('To : Chennai')],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Passenger Name:'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Santhosh'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Age :'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('19'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Date :'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(DateTime.now().toString()),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Departure Time :'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('18:00'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Class :'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('AC'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
