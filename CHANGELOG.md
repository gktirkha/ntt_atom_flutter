## 2.0.0
- **Breaking:** `AtomSDK` is now a fully static class; call `AtomSDK.checkOut(...)` directly instead of `AtomSDK().checkOut(...)`
- **Breaking:** Renamed `AtomPaymentMode` to `AtomEnv` and `AtomReturnUrlMode` to `AtomCallbackMode`
- **Breaking:** Replaced the `flutter_inappwebview` WebView backend with `webview_flutter`; replaced `http`/`crypto` with `dio`/`cryptography` for networking and hashing
- Fixed `AtomCallbackMode.forwardEncrypted` and `forwardUnencrypted` being swapped: `forwardEncrypted` now forwards only the raw `encData=<value>` payload, and `forwardUnencrypted` now forwards the decrypted JSON payload, matching their names
- Added UPI deep-link support for Google Pay, PhonePe, and Paytm, with a snackbar fallback when the target app isn't installed
- Added `onUserExitRequest` callback to `checkOut` to intercept and optionally block the user leaving the payment screen (e.g. system back gesture)
- Added `preProcessorDialogBuilder` to `checkOut` for supplying a custom dialog shown while the transaction token is being requested
- Fixed SDK not closing with `AtomTransactionStatus.failed` when a JavaScript error occurs in the checkout WebView
- Fixed unhandled failure when the Atom checkout CDN script fails to load
- Reorganized package internals (`models/`, `helpers/`, `routes/`, `ui/`, `constants/`) and added full dartdoc coverage for all public API members
- Updated dependencies: `freezed` 3.2.5, `json_serializable` 6.14.0, `build_runner` 2.15.1, `flutter_lints` 6.0.0; bumped minimum Dart SDK to `^3.12.2`

## 1.0.7+1
- Updated Readme

## 1.0.7
- Added `AtomReturnUrlConfig` model with three forwarding modes: `sendToServer`, `forwardEncrypted`, and `forwardUnencrypted`
- Replaced `returnUrl` string field in `AtomPaymentOptions` with nullable `returnUrlConfig: AtomReturnUrlConfig?`; passing `null` (default) preserves existing behavior
- `forwardEncrypted`: SDK captures response at default URL, POSTs extracted encrypted payload as plain text to provided URL, then decrypts to determine transaction status
- `forwardUnencrypted`: SDK captures response at default URL, decrypts it, POSTs JSON to provided URL, then determines transaction status
- Empty `returnUrl` in config falls back to default SDK behavior
- Renamed `AtomConstants.defaultUrl` to `AtomConstants.defaultReturnUrl` for clarity; added as `@Default` on `AtomReturnUrlConfig.returnUrl`
- Added iOS `LSApplicationQueriesSchemes` and Android `<queries>` setup instructions to README
- Updated example app with amount input, return URL input, and mode dropdown

## 0.0.1
- Initial Release.

## 1.0.0
- Readme Fix

## 1.0.1
- License Update

## 1.0.2
- Changed SDK Mechanism to use singleton approach, Removed intl and used custom method for date and time

## 1.0.3
- Optimized AtomNavigatorObserver to record only atom route

## 1.0.4
- Fix: SDK not closing on payment success

## 1.0.5
- License Update

## 1.0.6
- Dependency Update