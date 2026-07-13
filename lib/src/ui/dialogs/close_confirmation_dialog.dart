import 'package:flutter/material.dart';

import '../../sdk/atom_s_d_k.dart';

Future<Object?> showCloseConfirmationDialog(
  BuildContext context,
  ValueNotifier<bool> canPop,
) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Cancel Payment',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),
            Text(
              'Are You Sure You Want to cancel the payment?',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('No, Go Back'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    canPop.value = true;
                    AtomSDK.close(
                      transactionStatus: .cancelled,
                      data: {'message': 'Payment Cancelled By User'},
                    );
                  },
                  child: Text('Yes, Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
