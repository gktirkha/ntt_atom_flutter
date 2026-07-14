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
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        colorScheme: .fromSeed(seedColor: Colors.blue),
      ),
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
  final _loginController = TextEditingController(text: '317157');
  final _passwordController = TextEditingController(text: 'Test@123');
  final _prodidController = TextEditingController(text: 'NSE');
  final _requestHashKeyController = TextEditingController(
    text: 'KEY1234567234',
  );
  final _responseHashKeyController = TextEditingController(
    text: 'KEYRESP123657234',
  );
  final _requestEncryptionKeyController = TextEditingController(
    text: 'A4476C2062FFA58980DC8F79EB6A799E',
  );
  final _responseDecryptionKeyController = TextEditingController(
    text: '75AEF0FA1B94B3C10D4F5B268F757F11',
  );
  final _txncurrController = TextEditingController(text: 'INR');
  final _amountController = TextEditingController(text: '100');
  final _merchTypeController = TextEditingController(text: 'R');
  final _mccCodeController = TextEditingController(text: '5499');
  final _clientcodeController = TextEditingController(text: 'NAVIN');
  final _addressController = TextEditingController(text: 'mumbai');
  final _custFirstNameController = TextEditingController(text: 'test');
  final _custLastNameController = TextEditingController(text: 'test');
  final _emailController = TextEditingController(text: 'test@gmail.com');
  final _mobileController = TextEditingController(text: '8888888888');
  final _custaccController = TextEditingController(text: '639827');
  final _udf1Controller = TextEditingController(text: 'udf1');
  final _udf2Controller = TextEditingController(text: 'udf2');
  final _udf3Controller = TextEditingController(text: 'udf3');
  final _udf4Controller = TextEditingController(text: 'udf4');
  final _udf5Controller = TextEditingController(text: 'udf5');
  final _txnidController = TextEditingController(text: 'test240223');

  final _returnUrlController = TextEditingController();
  AtomCallbackMode _selectedMode = .sendToServer;
  AtomEnv _selectedEnv = .uat;

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _prodidController.dispose();
    _requestHashKeyController.dispose();
    _responseHashKeyController.dispose();
    _requestEncryptionKeyController.dispose();
    _responseDecryptionKeyController.dispose();
    _txncurrController.dispose();
    _amountController.dispose();
    _merchTypeController.dispose();
    _mccCodeController.dispose();
    _clientcodeController.dispose();
    _addressController.dispose();
    _custFirstNameController.dispose();
    _custLastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _custaccController.dispose();
    _udf1Controller.dispose();
    _udf2Controller.dispose();
    _udf3Controller.dispose();
    _udf4Controller.dispose();
    _udf5Controller.dispose();
    _txnidController.dispose();
    _returnUrlController.dispose();
    super.dispose();
  }

  AtomReturnUrlConfig? get _returnUrlConfig {
    final url = _returnUrlController.text.trim();
    if (url.isEmpty) return null;
    return AtomReturnUrlConfig(returnUrl: url, mode: _selectedMode);
  }

  Future<bool> _onUserExitRequest() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Payment?'),
        content: const Text('Are you sure you want to exit the payment?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
    return shouldExit ?? false;
  }

  void _startPayment() {
    AtomSDK.checkOut(
      sdkOptions: AtomPaymentOptions(
        login: _loginController.text.trim(),
        password: _passwordController.text.trim(),
        prodid: _prodidController.text.trim(),
        requestHashKey: _requestHashKeyController.text.trim(),
        responseHashKey: _responseHashKeyController.text.trim(),
        requestEncryptionKey: _requestEncryptionKeyController.text.trim(),
        responseDecryptionKey: _responseDecryptionKeyController.text.trim(),
        txncurr: _txncurrController.text.trim(),
        amount: _amountController.text.trim(),
        merchType: _merchTypeController.text.trim(),
        mccCode: _mccCodeController.text.trim(),
        clientcode: _clientcodeController.text.trim(),
        address: _addressController.text.trim(),
        custFirstName: _custFirstNameController.text.trim(),
        custLastName: _custLastNameController.text.trim(),
        email: _emailController.text.trim(),
        mobile: _mobileController.text.trim(),
        custacc: _custaccController.text.trim(),
        udf1: _udf1Controller.text.trim(),
        udf2: _udf2Controller.text.trim(),
        udf3: _udf3Controller.text.trim(),
        udf4: _udf4Controller.text.trim(),
        udf5: _udf5Controller.text.trim(),
        mode: _selectedEnv,
        txnid: _txnidController.text.trim(),
        returnUrlConfig: _returnUrlConfig,
      ),
      onClose: (transactionStatus, data) {
        log(
          'Transaction Status ${transactionStatus.name}\nTransaction Data $data',
          name: 'ATOM Payment Status',
        );
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(.new(content: Text(transactionStatus.name)));
      },
      onUserExitRequest: _onUserExitRequest,
    );
  }

  Widget _textField(
    TextEditingController controller,
    String label, {
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasReturnUrl = _returnUrlController.text.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('Atom Pay Example')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _textField(_loginController, 'Login'),
                    _textField(_passwordController, 'Password'),
                    _textField(_prodidController, 'Product ID'),
                    _textField(_requestHashKeyController, 'Request Hash Key'),
                    _textField(_responseHashKeyController, 'Response Hash Key'),
                    _textField(
                      _requestEncryptionKeyController,
                      'Request Encryption Key',
                    ),
                    _textField(
                      _responseDecryptionKeyController,
                      'Response Decryption Key',
                    ),
                    _textField(_txncurrController, 'Transaction Currency'),
                    _textField(
                      _amountController,
                      'Amount',
                      keyboardType: TextInputType.number,
                    ),
                    _textField(_merchTypeController, 'Merchant Type'),
                    _textField(
                      _mccCodeController,
                      'MCC Code',
                      keyboardType: TextInputType.number,
                    ),
                    _textField(_clientcodeController, 'Client Code'),
                    _textField(_addressController, 'Address'),
                    _textField(_custFirstNameController, 'Customer First Name'),
                    _textField(_custLastNameController, 'Customer Last Name'),
                    _textField(
                      _emailController,
                      'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _textField(
                      _mobileController,
                      'Mobile',
                      keyboardType: TextInputType.phone,
                    ),
                    _textField(_custaccController, 'Customer Account No.'),
                    _textField(_udf1Controller, 'UDF 1'),
                    _textField(_udf2Controller, 'UDF 2'),
                    _textField(_udf3Controller, 'UDF 3'),
                    _textField(_udf4Controller, 'UDF 4'),
                    _textField(_udf5Controller, 'UDF 5'),
                    _textField(_txnidController, 'Transaction ID'),
                    DropdownButtonFormField<AtomEnv>(
                      initialValue: _selectedEnv,
                      decoration: const InputDecoration(
                        labelText: 'Environment',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(value: .uat, child: Text('UAT')),
                        DropdownMenuItem(value: .live, child: Text('Live')),
                      ],
                      onChanged: (value) {
                        if (value != null) setState(() => _selectedEnv = value);
                      },
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
                          if (value != null) {
                            setState(() => _selectedMode = value);
                          }
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Container(
              margin: .only(top: 8),
              width: .maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: _startPayment,
                child: const Text('Start Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
