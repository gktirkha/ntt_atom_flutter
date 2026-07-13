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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _amountController = TextEditingController(text: '400');
  final _returnUrlController = TextEditingController();
  AtomCallbackMode _selectedMode = .sendToServer;

  @override
  void dispose() {
    _amountController.dispose();
    _returnUrlController.dispose();
    super.dispose();
  }

  AtomReturnUrlConfig? get _returnUrlConfig {
    final url = _returnUrlController.text.trim();
    if (url.isEmpty) return null;
    return AtomReturnUrlConfig(returnUrl: url, mode: _selectedMode);
  }

  void _startPayment() {
    AtomSDK.checkOut(
      sdkOptions: AtomPaymentOptions(
        login: '317157',
        password: 'Test@123',
        prodid: 'NSE',
        requestHashKey: 'KEY1234567234',
        responseHashKey: 'KEYRESP123657234',
        requestEncryptionKey: 'A4476C2062FFA58980DC8F79EB6A799E',
        responseDecryptionKey: '75AEF0FA1B94B3C10D4F5B268F757F11',
        txncurr: 'INR',
        amount: _amountController.text.trim(),
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
        mode: .uat,
        txnid: 'test240223',
        returnUrlConfig: _returnUrlConfig,
      ),
      onClose: (transactionStatus, data) {
        log(
          'Transaction Status ${transactionStatus.name}\nTransaction Data $data',
          name: 'ATOM Payment Status',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasReturnUrl = _returnUrlController.text.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('Atom Pay Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
                prefixText: '₹ ',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _returnUrlController,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                labelText: 'Return URL (optional)',
                hintText: 'https://your-server.com/callback',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            if (hasReturnUrl) ...[
              const SizedBox(height: 16),
              DropdownButtonFormField<AtomCallbackMode>(
                initialValue: _selectedMode,
                decoration: const InputDecoration(
                  labelText: 'Return URL Mode',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: .sendToServer,
                    child: Text('Send to Server'),
                  ),
                  DropdownMenuItem(
                    value: .forwardEncrypted,
                    child: Text('Forward Encrypted'),
                  ),
                  DropdownMenuItem(
                    value: .forwardUnencrypted,
                    child: Text('Forward Unencrypted'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _selectedMode = value);
                },
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _startPayment,
              child: const Text('Start Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
