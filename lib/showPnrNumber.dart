import 'package:flutter/material.dart';

class ShowPNR extends StatelessWidget {
  final PNR;
  ShowPNR({this.PNR});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PNR == null ? Text("Payment Error") : Text("Your PNR!"),
      ),
      body: PNR == null
          ? Center(child: Text("Sorry! Your payment was declined."))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your PNR number is : ",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "$PNR",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.home),
                    label: Text("Back to Home"),
                  )
                ],
              ),
            ),
    );
  }
}
