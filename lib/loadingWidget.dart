import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: const CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Color(0xFF2196F3),
                strokeWidth: 5,
              ),
            ),
            Text("Loading..."),
          ],
        ),
      ),
    );
  }
}
