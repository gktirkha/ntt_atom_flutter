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
      navigatorObservers: [AtomSDK.atomNavigatorObserver],
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
            final AtomSDK instance = AtomSDK(
              onClose: (status, data) {
                print('Status $status');
                print('Data $data');
              },
              options: AtomPaymentOptions(
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
            );
            instance.startPayment();
          },
          child: Text('Start Payment'),
        ),
      ),
    );
  }
}
