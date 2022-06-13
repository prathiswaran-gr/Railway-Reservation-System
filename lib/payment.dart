import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';


class RazorPayApp extends StatefulWidget {
  @override
  State<RazorPayApp> createState() => _RazorPayAppState();
}

class _RazorPayAppState extends State<RazorPayApp> {
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Razorpay Sample App'),
      //   ),
      //   body: Center(
      //       child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //         ElevatedButton(onPressed: openCheckout, child: Text('Open'))
      //       ])),
      // ),
    );
  }

 
}








//   'key': 'rzp_test_MRHHnrHFYsUO2a',
    
