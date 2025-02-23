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


## Drawbacks of Using a Custom Return URL  

When initializing a transaction, the **returnUrl** is optional. However, using a custom return URL comes with some limitations:  

1. **Limited Transaction Status Detection:**  
   - If a return URL is provided, the SDK **cannot automatically detect the transaction status** or retrieve data from NTT.  
   - Instead, the SDK will return whatever response it receives from the server as a raw string.  

2. **No Webhook Notification:**  
   - If a return URL is **not** provided, the backend server **will not receive a webhook response** from NTT.  

### **Solution:**  
If you choose to use a custom return URL, you will need to set up a **custom backend API** to manually check the transaction status. This ensures you can verify payments reliably.  

# Contributions
Contributions are welcome! Please fork the repository and submit a pull request. For bug reports or feature requests, please open an issue on the [GitHub repository.](https://github.com/gktirkha/ntt_atom_flutter)

# License
ntt_atom_flutter is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

# API reference
Please check [API reference](https://gktirkha.github.io/flutter_packages_doc/ntt_atom_flutter) for documentation