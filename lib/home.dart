import 'package:flutter/material.dart';
import 'package:railway_reservation/booking.dart';
import 'package:railway_reservation/passenger.dart';
import 'package:railway_reservation/searchTrain.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Railway Reservation System'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.train), text: 'Search'),
              Tab(
                icon: Icon(Icons.search),
                text: 'PNR Status',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Booking(),
            SearchTrain(),
          ],
        ),
      ),
    );
  }
}
