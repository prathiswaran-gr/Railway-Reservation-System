import 'package:flutter/material.dart';

import 'package:railway_reservation/payment/book.dart';

class TrainList extends StatelessWidget {
  Object data;

  TrainList({this.data});

  @override
  Widget build(BuildContext context) {
    List<String> trainDetails = [];
    for (var i in data) {
      trainDetails.add(i.toString());
    }
    String train_id = trainDetails[0];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Passenger(id: train_id)));
        },
        child: Card(
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(trainDetails[0]),
                    const SizedBox(width: 10),
                    Text(trainDetails[1]),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(trainDetails[2]),
                        trainDetails[6].length == 14
                            ? Text(trainDetails[6].substring(0, 4))
                            : Text(trainDetails[6].substring(0, 5)),
                        Text(trainDetails[4].substring(0, 11)),
                      ],
                    ),
                    const Icon(Icons.arrow_forward),
                    Column(
                      children: [
                        Text(trainDetails[3]),
                        trainDetails[7].length == 14
                            ? Text(trainDetails[7].substring(0, 4))
                            : Text(trainDetails[7].substring(0, 5)),
                        Text(trainDetails[5].substring(0, 11)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
