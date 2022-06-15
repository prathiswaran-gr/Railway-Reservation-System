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
          : Center(child: Text("Your PNR number is : $PNR")),
    );
  }
}
