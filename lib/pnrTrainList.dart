import 'package:flutter/material.dart';

import 'passenger.dart';

class PnrTrainList extends StatelessWidget {
  int train_id, age;
  String pnr_no, train_name, from, to, name;
  DateTime d_date, a_date;
  String d_time, a_time;

  PnrTrainList({
    this.pnr_no,
    this.train_id,
    this.train_name,
    this.from,
    this.to,
    this.name,
    this.age,
    this.d_date,
    this.a_date,
    this.d_time,
    this.a_time,
  });

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
                      Text(pnr_no),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('$train_id'), Text(train_name)],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('From : $from'), Text('To : $to')],
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
                      Text(name),
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
                      Text('$age'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Depature Date :'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(d_date.toString().substring(0, 11)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Arrival Date :'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(a_date.toString().substring(0, 11)),
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
                      Text(d_time),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Arrival Time :'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(a_time),
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
