import 'package:flutter/material.dart';
import 'package:railway_reservation/trainCard.dart';

class Trains extends StatelessWidget {
  List<Object> data;

  Trains({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trains',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: data.map((key) => TrainList(data: key)).toList(),
        ),
      ),
    );
  }
}
