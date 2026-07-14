import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../ntt_atom_flutter.dart';
import '../constants/atom_constants.dart';
import '../context_utils/atom_navigator_observer.dart';
import '../exception/atom_exception.dart';
import '../helpers/payment_helper.dart';
import '../routes/atom_dialog_route.dart';
import '../routes/atom_page_route.dart';
import '../ui/dialogs/pre_processor_dialog.dart';
import '../ui/pages/atom_web_view_page.dart';

/// Entry point for integrating the Atom payment gateway checkout flow.
abstract class AtomSDK {
  static Function(
    AtomTransactionStatus transactionStatus,
    Map<String, dynamic> data,
  )?
  _onClose;
  /// The [NavigatorObserver] that must be registered on the app's
  /// [Navigator] so the SDK can track and dismiss the routes it pushes.
  static NavigatorObserver get navigatorObserver => _internalNav;
  static final AtomNavigatorObserver _internalNav = AtomNavigatorObserver();

  /// Dismisses any routes pushed by the SDK and invokes the `onClose`
  /// callback passed to [checkOut] with [transactionStatus] and [data].
  static void close({
    required AtomTransactionStatus transactionStatus,
    required Map<String, dynamic> data,
  }) {
    _internalNav.closeAtomSDK();
    _onClose?.call(transactionStatus, data);
  }

  /// Starts a payment using [sdkOptions] and pushes the pre-processor and
  /// checkout WebView pages onto the navigator registered via
  /// [navigatorObserver].
  ///
  /// [onClose] is invoked with the final [AtomTransactionStatus] and
  /// response data once the flow completes, fails, or is cancelled.
  /// [onUserExitRequest] is called when the user attempts to leave the
  /// checkout page and may return `false` to block the exit.
  /// [preProcessorDialogBuilder] can be used to supply a custom dialog
  /// shown while the transaction token is being requested, in place of the
  /// default [PreProcessorDialog].
  static Future<void> checkOut({
    required AtomPaymentOptions sdkOptions,
    required Function(
      AtomTransactionStatus transactionStatus,
      Map<String, dynamic> data,
    )
    onClose,
    Future<bool> Function()? onUserExitRequest,
    Widget Function(Future<String> paymentDetailsFuture)?
    preProcessorDialogBuilder,
  }) async {
    _onClose = onClose;
    final navigator = navigatorObserver.navigator;
    if (navigator == null) {
      log(
        'Please Add AtomSDK.navigatorObserver to navigator observer',
        name: AtomConstants.logName,
      );
      return;
    }

    final paymentDetailsCompleter = Completer<String>();
    final forwardUrl = sdkOptions.returnUrlConfig?.returnUrl.trim();
    sdkOptions = sdkOptions.copyWith(
      returnUrlConfig: _resolveCallBackConfig(sdkOptions.returnUrlConfig),
    );

    navigator.push(
      AtomDialogRoute(
        pageBuilder: (context, animation, secondaryAnimation) =>
            preProcessorDialogBuilder?.call(paymentDetailsCompleter.future) ??
            PreProcessorDialog(
              paymentDetailsCompleter: paymentDetailsCompleter,
            ),
      ),
    );

    unawaited(
      PaymentHelper.startPayment(sdkOptions).then(
        paymentDetailsCompleter.complete,
        onError: paymentDetailsCompleter.completeError,
      ),
    );

    final paymentDetails = await paymentDetailsCompleter.future.catchError((e) {
      if (e is AtomException) {
        log(e.toString(), name: AtomConstants.logName);
      }
      return '';
    });

    _internalNav.closeAtomSDK();

    if (paymentDetails.isEmpty) return;

    navigator.push(
      AtomPageRoute(
        builder: (context) => AtomWebViewPage(
          payDetails: paymentDetails,
          options: sdkOptions,
          forwardUrl: forwardUrl,
          onUserExitRequest: onUserExitRequest,
        ),
      ),
    );
  }

  static AtomReturnUrlConfig _resolveCallBackConfig(
    AtomReturnUrlConfig? urlConfig,
  ) {
    if (urlConfig == null) {
      return .new(
        mode: .forwardEncrypted,
        returnUrl: AtomConstants.defaultReturnUrl,
      );
    }

    if (urlConfig.returnUrl.trim().isEmpty) {
      return urlConfig.copyWith(returnUrl: AtomConstants.defaultReturnUrl);
    }

    return urlConfig.copyWith(
      returnUrl: switch (urlConfig.mode) {
        .sendToServer => urlConfig.returnUrl.trim(),
        .forwardEncrypted ||
        .forwardUnencrypted => AtomConstants.defaultReturnUrl,
      },
    );
  }
}
