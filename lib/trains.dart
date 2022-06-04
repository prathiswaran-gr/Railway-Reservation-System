import 'package:flutter/material.dart';
import 'package:railway_reservation/showTrains.dart';

class Trains extends StatelessWidget {
  const Trains({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trains',
        ),
      ),
      body: TrainList(),
    );
  }
}
