import 'package:flutter/material.dart';

class Passenger extends StatelessWidget {
  const Passenger({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Center(
        child: Container(
          width: 450,
          height: 230,
          margin: const EdgeInsets.all(30.0),
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
                width: 300,
                height: 75,
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: 'Name', hintText: 'Enter Your Name Here !'),

                  controller: nameController,
                  // onSubmitted: (_) => _submitData(),
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                ),
              ),
              SizedBox(
                width: 300,
                height: 75,
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: 'Age', hintText: 'Enter Your Age Here !'),

                  controller: ageController,
                  // onSubmitted: (_) => _submitData(),
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Book'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
