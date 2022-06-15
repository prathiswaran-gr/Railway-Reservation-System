import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'loadingWidget.dart';
import 'model/mysql.dart';
import 'trainList.dart';

class Booking extends StatefulWidget {
  const Booking({Key key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<Object> trainDetailsList = [];
  var db = MySql();
  String dateTime;
  bool isSearchButtonClicked = false;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  DateTime currentDate = DateTime.now();
  String selectedValue = "SL";

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("SL"), value: "SL"),
    DropdownMenuItem(child: Text("AC"), value: "AC"),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.8;
    var height = MediaQuery.of(context).size.height / 1.6;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 300,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 3,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  height: height / 8,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'From'),
                    controller: fromController,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height / 8,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'To'),
                    controller: toController,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: currentDate.add(
                              const Duration(days: 90),
                            ),
                            builder: (context, child) => Theme(
                                  data: ThemeData(
                                    primarySwatch: Colors.blue,
                                    primaryColor: Colors.blue,
                                  ),
                                  child: child,
                                )).then((date) {
                          setState(() {
                            dateTime = DateFormat('yyyy-MM-dd').format(date);
                          });
                        });
                      },
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    dateTime == null
                        ? Text(
                            'No date Chosen',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        : Text(
                            dateTime.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                  ],
                ),
                checkSearchButtonEnabled()
                    ? ElevatedButton(
                        onPressed: () async {
                          getTrainDetails();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loading()));

                          await Future.delayed(const Duration(seconds: 3), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Trains(
                                        data: trainDetailsList,
                                      )),
                            );
                          });
                          fromController.clear();
                          toController.clear();
                          setState(() {
                            dateTime = null;
                          });
                        },
                        child: Text('Search Trains'),
                      )
                    : const ElevatedButton(
                        onPressed: null,
                        child: Text("Search Train"),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool checkSearchButtonEnabled() {
    if (fromController.text.isNotEmpty &&
        toController.text.isNotEmpty &&
        dateTime != null) {
      setState(() {
        isSearchButtonClicked = true;
      });
    } else {
      setState(() {
        isSearchButtonClicked = false;
      });
    }
    return isSearchButtonClicked;
  }

  void getTrainDetails() {
    db.getConnection().then((conn) {
      String sql =
          "select * from train where _from = '${fromController.text}' and _to = '${toController.text}' and departure_date = '$dateTime';";
      conn.query(sql).then((res) {
        for (var row in res) {
          trainDetailsList.add(row);
        }
      });
      conn.close();
    });
  }
}
