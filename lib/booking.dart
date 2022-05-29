import 'package:flutter/material.dart';

import 'trains.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController fromController = TextEditingController();
    TextEditingController toController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController classController = TextEditingController();
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
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent,
                width: 3,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 75,
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
                      width: 300,
                      height: 75,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 75,
                          child: TextField(
                            decoration:
                                const InputDecoration(labelText: 'Date'),
                            controller: dateController,
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
                          width: 300,
                          height: 75,
                          child: TextField(
                            decoration:
                                const InputDecoration(labelText: 'Class'),
                            controller: classController,
                            // onSubmitted: (_) => _submitData(),
                            // onChanged: (val) {
                            //   titleInput = val;
                            // },
                          ),
                        ),
                      ],
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
