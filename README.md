# NTT Atom Pay Flutter SDK

This Package Provides Simpler Integration For NTT Atom pay

Example:

  ```dart
  import 'dart:developer';

  import 'package:flutter/material.dart';
  import 'package:ntt_atom_flutter/ntt_atom_flutter.dart';

  void main() {
    runApp(const MainApp());
  }

  class MainApp extends StatelessWidget {
    const MainApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        navigatorObservers: [AtomSDK.navigatorObserver],
        home: Home(),
      );
    }
  }

  class Home extends StatelessWidget {
    const Home({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              final instance = AtomSDK();
              instance.checkOut(
                sdkOptions: AtomPaymentOptions(
                  login: '317157',
                  password: 'Test@123',
                  prodid: 'NSE',
                  requestHashKey: 'KEY1234567234',
                  responseHashKey: 'KEYRESP123657234',
                  requestEncryptionKey: 'A4476C2062FFA58980DC8F79EB6A799E',
                  responseDecryptionKey: '75AEF0FA1B94B3C10D4F5B268F757F11',
                  txncurr: 'INR',
                  amount: '400',
                  merchType: 'R',
                  mccCode: '5499',
                  clientcode: 'NAVIN',
                  address: 'mumbai',
                  custFirstName: 'test',
                  custLastName: 'test',
                  email: 'test@gmail.com',
                  mobile: '8888888888',
                  custacc: '639827',
                  udf1: 'udf1',
                  udf2: 'udf2',
                  udf3: 'udf3',
                  udf4: 'udf4',
                  udf5: 'udf5',
                  mode: AtomPaymentMode.uat,
                  txnid: 'test240223',
                ),
                onClose: (transactionStatus, data) {
                  log(
                    "Transaction Status ${transactionStatus.name.toString()}\nTransaction Data ${data.toString()}",
                    name: "ATOM Payment Status",
                  );
                },
              );
            },
            child: Text('Start Payment'),
          ),
        ),
      );
    }
  }

  ```

## Usage

1. add ```AtomSDK.atomNavigatorObserver``` in app navigatorObservers

    ```dart
      MaterialApp(
          navigatorObservers: [AtomSDK.navigatorObserver],
          home: Home(),
      )
    ```

1. Initialize the object
    ```dart
    final instance = AtomSDK();
    ```

1. Check Out
    ```dart
      instance.checkOut(
              sdkOptions: AtomPaymentOptions(
                login: '317157',
                password: 'Test@123',
                prodid: 'NSE',
                requestHashKey: 'KEY1234567234',
                responseHashKey: 'KEYRESP123657234',
                requestEncryptionKey: 'A4476C2062FFA58980DC8F79EB6A799E',
                responseDecryptionKey: '75AEF0FA1B94B3C10D4F5B268F757F11',
                txncurr: 'INR',
                amount: '400',
                merchType: 'R',
                mccCode: '5499',
                clientcode: 'NAVIN',
                address: 'mumbai',
                custFirstName: 'test',
                custLastName: 'test',
                email: 'test@gmail.com',
                mobile: '8888888888',
                custacc: '639827',
                udf1: 'udf1',
                udf2: 'udf2',
                udf3: 'udf3',
                udf4: 'udf4',
                udf5: 'udf5',
                mode: AtomPaymentMode.uat,
                txnid: 'test240223',
              ),
              onClose: (transactionStatus, data) {
                log(
                  "Transaction Status ${transactionStatus.name.toString()}\nTransaction Data ${data.toString()}",
                  name: "ATOM Payment Status",
                );
              },
            );
    ```


## Custom Return URL

By default (`returnUrlConfig` is `null`) the SDK uses its own return URL, fully parses the transaction response, and delivers a typed `AtomTransactionStatus` to `onClose`. No extra configuration is needed for this path.

If you need your backend to also receive the transaction data, set `returnUrlConfig` in `AtomPaymentOptions`:

```dart
AtomPaymentOptions(
  ...
  returnUrlConfig: AtomReturnUrlConfig(
    returnUrl: 'https://your-server.com/payment/callback',
    mode: AtomReturnUrlMode.forwardUnencrypted, // or forwardEncrypted / sendToServer
  ),
)
```

### Modes

| Mode | How it works | App gets status? |
|---|---|---|
| `sendToServer` | Gateway redirects the WebView straight to your URL. The app receives the raw page content as a string. | No (unknown) |
| `forwardEncrypted` | SDK captures the response at its default URL, extracts the encrypted payload from the page, POSTs it as-is (`Content-Type: text/plain`) to your URL, then separately decrypts it to determine the status for the app. | Yes |
| `forwardUnencrypted` | SDK captures the response at its default URL, decrypts it, POSTs the **JSON** (`Content-Type: application/json`) to your URL, then parses the status for the app. | Yes |

> **Note:** For `forwardEncrypted` and `forwardUnencrypted`, a POST failure to your server is silently ignored — the SDK status callback is always delivered.

## Android Configuration

Add the `INTERNET` permission and a `<queries>` block to your `android/app/src/main/AndroidManifest.xml`. The `<queries>` block is required on Android 11+ (API 30+) for the OS to allow the SDK to launch UPI payment apps.

```xml
<manifest>
    <uses-permission android:name="android.permission.INTERNET" />

    <queries>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="tez" />
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="phonepe" />
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="paytmmp" />
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="upi" />
        </intent>
    </queries>

    <application ...>
        ...
    </application>
</manifest>
```

## iOS Configuration

To allow the SDK to launch UPI payment apps (Google Pay, PhonePe, Paytm) on iOS, you must declare their URL schemes in your app's `Info.plist`. Without this, iOS will silently block the deep link and the SDK will show a snackbar asking the user to try another payment method.

Add the following to your `ios/Runner/Info.plist`:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>tez</string>
    <string>phonepe</string>
    <string>paytmmp</string>
    <string>upi</string>
</array>
```

# Contributions
Contributions are welcome! Please fork the repository and submit a pull request. For bug reports or feature requests, please open an issue on the [GitHub repository.](https://github.com/gktirkha/ntt_atom_flutter)

# License
ntt_atom_flutter is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.