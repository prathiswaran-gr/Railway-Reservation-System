import 'package:flutter/material.dart';

import 'payment/book.dart';

class PnrTrainList extends StatelessWidget {
  int train_id, age;
  String pnr_no, train_name, from, to, name;
  DateTime d_date, a_date;
  String d_time, a_time;

  PnrTrainList({
    Key key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Status"),
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
                      const Text('PNR Number:',style: TextStyle(fontSize:20),),
                      Text(pnr_no,style: const TextStyle(fontSize:30,fontWeight:FontWeight.bold),),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('$train_id'), Text(train_name)],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('From : $from'), Text('To : $to')],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Passenger Name:'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(name),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Age :'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('$age'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text('Depature Date :'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(d_date.toString().substring(0, 11)),
                    ],
                  ),
                  const SizedBox(
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
