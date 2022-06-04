import 'package:flutter/material.dart';
import 'package:railway_reservation/pnrTrainList.dart';
import 'package:railway_reservation/trains.dart';

class SearchTrain extends StatelessWidget {
  const SearchTrain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController pnrController = TextEditingController();
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

                  // onSubmitted: (_) => _submitData(),
                  // onChanged: (val) {
                  //   titleInput = val;
                  // }88u8,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PnrTrainList()));
              },
              child: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
