import 'dart:math';

import 'package:flutter/material.dart';

import 'package:railway_reservation/showPnrNumber.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../model/mysql.dart';

class Passenger extends StatefulWidget {
  String id;

  Passenger({Key key, this.id}) : super(key: key);

  @override
  State<Passenger> createState() => _PassengerState();
}

class _PassengerState extends State<Passenger> {
  var db = MySql();

  Razorpay _razorpay;

  bool isTicketBooked = false;

  dynamic random;

  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: Center(
        child: Container(
          width: 280,
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
                width: 200,
                height: 75,
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: 'Name', hintText: 'Enter Your Name Here !'),
                  controller: nameController,
                ),
              ),
              SizedBox(
                width: 200,
                height: 75,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    hintText: 'Enter Your Age Here !',
                  ),
                  controller: ageController,
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                onPressed: openCheckout,
                child: const Text('Book'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      "key": "rzp_test_MRHHnrHFYsUO2a",
      "amount": "31500",
      "currency": "INR",
      "timeout": 120,
      "name": "Railway Reservation",
      "description": "Test Transaction",
      "image":
          "https://d2q79iu7y748jz.cloudfront.net/s/_squarelogo/256x256/7c2bf24ac3272c8360aa31b2631ee99e",
      "prefill": {
        "name": "Prathis",
        "email": "test@gmail.com",
        "contact": "1234567890"
      },
      "notes": {"address": "Autofy"},
      "theme": {"color": "#528FF0"},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() {
      isTicketBooked = true;
    });
    if (isTicketBooked) {
      genratePNR();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ShowPNR(PNR: random)));
      storeDetails();
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {}

  void genratePNR() {
    var rand = Random();
    random = rand.nextInt(900000000) + 3000000000;
  }

  void storeDetails() {
    db.getConnection().then((conn) {
      conn.query(
          "insert into passenger (pnr_no, _name, age, train_id) values ($random, '${nameController.text}', '${ageController.text}', ${widget.id})");
      conn.close();
    });
  }
}
