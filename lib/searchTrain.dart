import 'dart:async';

import 'package:flutter/material.dart';
import 'package:railway_reservation/loading.dart';
import 'package:railway_reservation/model/mysql.dart';
import 'package:railway_reservation/pnrTrainList.dart';
import 'package:railway_reservation/trains.dart';

class SearchTrain extends StatefulWidget {
  @override
  State<SearchTrain> createState() => _SearchTrainState();
}

class _SearchTrainState extends State<SearchTrain> {
  int train_id = 0, age = 0;

  String train_name = '', from = '', to = '', name = '', cls = '';

  DateTime d_date, a_date;

  Duration d_time, a_time;

  double value = 3;

  var db = MySql();

  TextEditingController pnrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 75,
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your 10 digit PNR',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  controller: pnrController,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                getTicketDetails();
                // Container(
                //   margin: EdgeInsets.all(20),
                //   child: CircularProgressIndicator(
                //     backgroundColor: Colors.grey,
                //     color: Colors.purple,
                //     strokeWidth: 5,
                //   ),
                // );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loading()));

                

                await Future.delayed(Duration(seconds: 3), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PnrTrainList(
                        pnr_no: pnrController.text,
                        train_id: train_id,
                        train_name: train_name,
                        name: name,
                        age: age,
                        from: from,
                        to: to,
                        d_date: d_date,
                        a_date: a_date,
                        d_time: d_time,
                        a_time: a_time,
                        cls: cls,
                      ),
                    ),
                  );
                });
              },
              child: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }

  void getTicketDetails() {
    db.getConnection().then((conn) {
      String sql =
          'select b.pnr_no, t.train_id, train_name, t._from, t._to, _name, age, t.departure_date, t.arrival_date, t.departure_time, t.arrival_time, class from train as t,passenger as p,booking as b where t.train_id = p.train_id and p.pnr_no = b.pnr_no and b.pnr_no = ${pnrController.text};';
      conn.query(sql).then((res) {
        for (var row in res) {
          train_id = row[1];
          train_name = row[2];
          from = row[3];
          to = row[4];
          name = row[5];
          age = row[6];
          d_date = row[7];
          a_date = row[8];
          d_time = row[9];
          a_time = row[10];
          cls = row[11];
        }
      });
      conn.close();
    });
  }
}
