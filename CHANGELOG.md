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