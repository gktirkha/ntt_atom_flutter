import 'dart:async';

import 'package:flutter/material.dart';

import '../../../ntt_atom_flutter.dart';

/// The default dialog shown while the transaction token is being requested
/// from the payment gateway, before the checkout WebView page opens.
class PreProcessorDialog extends StatelessWidget {
  /// Creates a pre-processor dialog that reacts to [paymentDetailsCompleter]
  /// completing with the payment details, or an error.
  PreProcessorDialog({super.key, required this.paymentDetailsCompleter});

  /// Completes with the JSON-encoded payment details once the transaction
  /// token has been obtained and validated, or with an error if it fails.
  final Completer<String> paymentDetailsCompleter;

  /// Whether the dialog is allowed to be popped; set to `true` once the
  /// flow has resolved (successfully or with an error).
  final ValueNotifier<bool> canPop = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: canPop,
      builder: (context, value, child) => PopScope(
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
              future: paymentDetailsCompleter.future,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Builder(
                    builder: (context) {
                      Future.delayed(
                        const Duration(seconds: 1, milliseconds: 500),
                        () {
                          canPop.value = true;
                          AtomSDK.close(
                            transactionStatus: .failed,
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
