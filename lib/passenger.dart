import 'dart:math';

import 'package:flutter/material.dart';
import 'package:railway_reservation/payment.dart';
import 'package:railway_reservation/showPNR.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'model/mysql.dart';

class Passenger extends StatefulWidget {
  String id;

  Passenger({this.id});

  @override
  State<Passenger> createState() => _PassengerState();
}

class _PassengerState extends State<Passenger> {
  // static const platform = const MethodChannel("razorpay_flutter");

  String id;
  _PassengerState({this.id});

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
        title: Text('Booking'),
      ),
      body: Center(
        child: Container(
          width: 320,
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
                onPressed: openCheckout,
                //() {
                //   // Navigator.push(
                //   //   context,
                //   //   MaterialPageRoute(
                //   //     builder: (context) => RazorPay(),
                //   //   ),
                //   // );
                // },
                child: Text('Book'),
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
      "image": "https://example.com/your_logo",
      "prefill": {
        "name": "Prathis",
        "email": "test@gmail.com",
        "contact": "1234567890"
      },
      "notes": {"address": "Autofy"},
      "theme": {"color": "#DF0145"},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    setState(() {
      isTicketBooked = true;
    });
    if (isTicketBooked) {
      genratePNR();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ShowPNR(PNR: random)));
      storeDetails();
    }
    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ShowPNR(PNR: random)));
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void genratePNR() {
    var rand = Random();
    random = rand.nextInt(900000000) + 3000000000;
    print(random);
  }

  void storeDetails() {
    db.getConnection().then((conn) {
      conn.query(
          "insert into passenger (pnr_no, _name, age, train_id) values ($random, '${nameController.text}', '${ageController.text}', $id)");
      conn.close();
    });
  }
}
