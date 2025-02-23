import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../ntt_atom_flutter.dart';
import '../pages/pre_processor_page.dart';
import '../router/atom_dialog_route.dart';
import '../router/atom_navigator_observer.dart'
    hide AtomRouteValidatorExtension;

/// Singleton class for handling Atom Payment SDK functionalities.
class AtomSDK {
  /// Private constructor for singleton instance.
  factory AtomSDK() => _instance;
  AtomSDK._internal();

  /// Singleton instance of [AtomSDK].
  static final AtomSDK _instance = AtomSDK._internal();

  /// Internal navigator observer for tracking navigation events.
  static final AtomNavigatorObserver _internalNaviGator =
      AtomNavigatorObserver();

  /// Provides the navigator observer instance for the application.
  static NavigatorObserver get navigatorObserver => _internalNaviGator;

  /// Callback function triggered when the transaction process is closed.
  static Function(
    AtomTransactionStatus transactionStatus,
    Map<String, dynamic> data,
  )?
  _onClose;

  /// Log label for debugging purposes.
  final String _logLabel = 'Atom SDK';

  /// Holds the payment options for the transaction.
  static late AtomPaymentOptions options;

  /// Closes the Atom SDK transaction and triggers the [_onClose] callback.
  ///
  /// - [transactionStatus]: The status of the transaction when closed.
  /// - [data]: Additional transaction data.
  static void close({
    required AtomTransactionStatus transactionStatus,
    required Map<String, dynamic> data,
  }) {
    _internalNaviGator.closeAtomSDK();
    _onClose?.call(transactionStatus, data);
  }

  /// Initiates the payment checkout process.
  ///
  /// - [sdkOptions]: The payment options to be used for the transaction.
  /// - [onClose]: Callback function triggered when the transaction completes or is closed.
  void checkOut({
    required AtomPaymentOptions sdkOptions,
    required Function(
      AtomTransactionStatus transactionStatus,
      Map<String, dynamic> data,
    )
    onClose,
  }) {
    try {
      _onClose = onClose;
      final navigator = _internalNaviGator.navigator;
      if (navigator == null) {
        log(
          'Please Add AtomSDK.navigatorObserver to navigator observer',
          name: _logLabel,
        );
        return;
      }
      options = sdkOptions;
      navigator.push(
        AtomDialogRoute(
          pageBuilder:
              (context, animation, secondaryAnimation) => PreProcessorPage(),
        ),
      );

      log(
        'AtomSDK.atomPaymentOptions is set\n ${jsonEncode(options)}',
        name: _logLabel,
      );
    } catch (e) {
      log(e.toString(), name: _logLabel);
      close(
        transactionStatus: AtomTransactionStatus.unknown,
        data: {'message': 'An Unknown Error Occurred', 'error': e.toString()},
      );
    }
  }
}
