import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'trains.dart';

class Booking extends StatefulWidget {
  const Booking({Key key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String dateTime;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController classController = TextEditingController();
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.2;
    var height = MediaQuery.of(context).size.height / 1.2;
    return Column(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width / 4.5,
                      height: height / 6,
                      child: TextField(
                        decoration: const InputDecoration(labelText: 'From'),
                        controller: fromController,
                        // onSubmitted: (_) => _submitData(),
                        // onChanged: (val) {
                        //   titleInput = val;
                        // },
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: width / 4.5,
                      height: height / 6,
                      child: TextField(
                        decoration: const InputDecoration(labelText: 'To'),
                        controller: toController,
                        // onSubmitted: (_) => _submitData(),
                        // onChanged: (val) {
                        //   titleInput = val;
                        // },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                dateTime =
                                    DateFormat('yyyy-MM-dd').format(date);
                              });
                            });
                          },
                          child: const Text('Choose Date'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          dateTime == null
                              ? 'No date Chosen'
                              : dateTime.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: width / 4.5,
                      height: height / 6,
                      child: TextField(
                        decoration: const InputDecoration(labelText: 'Class'),
                        controller: classController,
                        // onSubmitted: (_) => _submitData(),
                        // onChanged: (val) {
                        //   titleInput = val;
                        // },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
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
}
