import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/mysql.dart';
import 'trains.dart';

class Booking extends StatefulWidget {
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  var db = MySql();
  String dateTime;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController classController = TextEditingController();
  DateTime currentDate = DateTime.now();
  String selectedValue = "SL";

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("SL"), value: "SL"),
    DropdownMenuItem(child: Text("AC"), value: "AC"),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.2;
    var height = MediaQuery.of(context).size.height / 1.6;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 400,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  height: height / 8,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'From'),
                    controller: fromController,
                    // onSubmitted: (_) => _submitData(),
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height / 8,
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'To'),
                    controller: toController,
                    // onSubmitted: (_) => _submitData(),
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      child: const Text('Choose Date'),
                    ),
                    Text(
                      dateTime == null ? 'No date Chosen' : dateTime.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                    width: 100,
                    child: DropdownButton(
                      value: selectedValue,
                      onChanged: (String newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      items: menuItems,
                    )),
                ElevatedButton(
                  onPressed: () {
                    getTrainDetails();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Trains()),
                    );
                  },
                  child: Text('Search Trains'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void getTrainDetails() {
    db.getConnection().then((conn) {
      String sql = '';
      conn.query(sql).then((res) {
        print(res.toList());
      });
    });
  }
}
