import 'package:flutter/material.dart';

import '../functions/payment_initiator.dart';
import '../model/atom_constants.dart';
import '../router/atom_navigator_observer.dart';
import '../sdk/atom_s_d_k.dart';

/// A page that acts as a pre-processor before initiating the payment.
///
/// This page handles UI feedback and starts the payment process, displaying
/// either a loading indicator or an error message if the payment initiation fails.
class PreProcessorPage extends StatelessWidget {
  /// Creates an instance of [PreProcessorPage].
  ///
  /// - [navigator]: Handles navigation-related actions.
  /// - [instance]: The Atom SDK instance to process the payment.
  PreProcessorPage({
    super.key,
    required this.navigator,
    required this.instance,
  });

  /// The navigation observer instance.
  final AtomNavigatorObserver navigator;

  /// A ValueNotifier to manage whether the page can be popped.
  final ValueNotifier<bool> canPop = ValueNotifier<bool>(false);

  /// The Atom SDK instance to handle the payment process.
  final AtomSDK instance;

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
              future: startPayment(instance),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Builder(
                    builder: (context) {
                      // Delays execution to update UI and close transaction on error.
                      Future.delayed(
                        const Duration(seconds: 1, milliseconds: 500),
                        () {
                          canPop.value = true;
                          instance.close(
                            status: AtomTransactionStatus.failed,
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
