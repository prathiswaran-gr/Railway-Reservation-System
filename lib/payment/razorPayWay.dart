import 'dart:html';
import 'dart:ui' as ui;
//conditional import
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'UiFake.dart' if (dart.library.html) 'dart:ui' as ui;
import 'package:flutter/material.dart';

class RazorPayWeb extends StatefulWidget {
  @override
  State<RazorPayWeb> createState() => _RazorPayWebState();
}

class _RazorPayWebState extends State<RazorPayWeb> {
  bool isTickedBooked = false;
  @override
  Widget build(BuildContext context) {
    //register view factory
    ui.platformViewRegistry.registerViewFactory("rzp-html", (int viewId) {
      IFrameElement element = IFrameElement();
//Event Listener
      window.onMessage.forEach(
        (element) {
          print('Event Received in callback: ${element.data}');
          if (element.data == 'MODAL_CLOSED') {
            Navigator.pop(context);
          } else if (element.data == 'SUCCESS') {
            setState(() {
              isTickedBooked = true;
              Navigator.pop(context);
            });
            print('PAYMENT SUCCESSFULL!!!!!!!');
          }
        },
      );

      element.requestFullscreen();
      element.src = 'assets/html/payment.html';
      element.style.border = 'none';
      return element;
    });

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: HtmlElementView(viewType: 'rzp-html'),
          );
        },
      ),
    );
  }
}
