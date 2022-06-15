import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: const CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.blue,
            strokeWidth: 5,
          ),
        ),
      ),
    );
  }
}
