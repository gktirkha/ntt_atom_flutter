import 'package:flutter/material.dart';

import '../functions/payment_initiator.dart';
import '../model/atom_constants.dart';
import '../sdk/atom_s_d_k.dart';

/// A page that handles pre-processing before initiating payment.
class PreProcessorPage extends StatelessWidget {
  /// Constructor for [PreProcessorPage].
  PreProcessorPage({super.key});

  /// Notifier to determine whether the page can be popped.
  final ValueNotifier<bool> canPop = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: canPop,
      builder:
          (context, value, child) => PopScope(
            canPop: value,
            child: child!,
            onPopInvokedWithResult: (didPop, result) {
              if (value) {
                return;
              }
            },
          ),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: FutureBuilder(
              future: startPayment(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Builder(
                    builder: (context) {
                      Future.delayed(
                        const Duration(seconds: 1, milliseconds: 500),
                        () {
                          canPop.value = true;
                          AtomSDK.close(
                            transactionStatus: AtomTransactionStatus.failed,
                            data: {
                              'message': 'Unknown Error Occurred',
                              'error': snapshot.error.toString(),
                            },
                          );
                        },
                      );

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.error, color: Colors.red),
                          SizedBox(height: 16),
                          Text(
                            'Error Processing Payment',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(color: Colors.blue),
                      SizedBox(height: 16),
                      Text(
                        'Please Wait\nWe Are Processing Your Payment',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
