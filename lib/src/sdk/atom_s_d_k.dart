import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/atom_constants.dart';
import '../model/atom_payment_options.dart';
import '../pages/pre_processor_page.dart';
import '../router/atom_dialog_route.dart';
import '../router/atom_navigator_observer.dart';

/// The Atom SDK class for handling payments.
///
/// This class manages the payment flow, including starting transactions,
/// navigating through the payment process, and handling transaction closures.
class AtomSDK {
  /// Creates an instance of [AtomSDK].
  ///
  /// - [onClose]: A callback function that triggers when the transaction completes.
  /// - [options]: The payment options required for processing transactions.
  AtomSDK({required this.onClose, required this.options});

  /// The navigator observer for tracking AtomSDK-related navigation.
  static final AtomNavigatorObserver _atomNavigatorObserver =
      AtomNavigatorObserver();

  /// Provides access to the navigator observer.
  static NavigatorObserver get atomNavigatorObserver => _atomNavigatorObserver;

  /// Retrieves the navigator state associated with the Atom SDK.
  static NavigatorState? get _navigator => _atomNavigatorObserver.navigator;

  /// A log message identifier for debugging.
  final String _logMessageName = 'Atom SDK';

  /// Callback function triggered when the transaction completes.
  ///
  /// - [status]: The final transaction status.
  /// - [data]: The response data from the transaction.
  final Function(AtomTransactionStatus status, Map<dynamic, dynamic> data)
  onClose;

  /// The payment options required for processing the transaction.
  final AtomPaymentOptions options;

  /// Closes the Atom SDK and triggers the [onClose] callback.
  ///
  /// This method removes all Atom-related routes from the navigation stack
  /// and invokes the [onClose] function with the transaction status and data.
  void close({
    required AtomTransactionStatus status,
    required Map<dynamic, dynamic> data,
  }) {
    _atomNavigatorObserver.closeAtomSDK();
    onClose.call(status, data);
  }

  /// Starts the Atom payment process.
  ///
  /// This method initializes the payment flow by navigating to the
  /// [PreProcessorPage] within a dialog route.
  Future<void> startPayment() async {
    try {
      if (_navigator == null) {
        throw Exception('Please add AtomSDK.navigatorObserver to MaterialApp');
      } else {
        log(
          'AtomSDK.navigatorObserver is added to MaterialApp',
          name: _logMessageName,
        );
      }

      log(
        'AtomSDK.atomPaymentOptions is set\n ${jsonEncode(options)}',
        name: _logMessageName,
      );

      _navigator!.push(
        AtomDialogRoute(
          pageBuilder:
              (context, animation, secondaryAnimation) => PreProcessorPage(
                instance: this,
                navigator: _atomNavigatorObserver,
              ),
        ),
      );
    } catch (e) {
      log(e.toString(), name: _logMessageName);
      if (_navigator != null) {
        _atomNavigatorObserver.closeAtomSDK();
      }
    }
  }
}
