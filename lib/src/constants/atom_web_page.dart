import 'dart:convert';

import 'atom_constants.dart';
import 'enums/atom_env.dart';

/// Builds the local HTML page used to bootstrap the Atom checkout script.
sealed class AtomWebPage {
  /// Returns the HTML document that loads the Atom checkout CDN script for
  /// [mode] and invokes it with the given [payDetails].
  static String page(AtomEnv mode, String payDetails) {
    final cdnUrl = switch (mode) {
      AtomEnv.live =>
        'https://psa.atomtech.in/staticdata/ots/js/atomcheckout.js',
      AtomEnv.uat =>
        'https://pgtest.atomtech.in/staticdata/ots/js/atomcheckout.js',
    };
    final paynetzMode = switch (mode) {
      AtomEnv.live => 'live',
      AtomEnv.uat => 'uat',
    };

    return '''
<!DOCTYPE html>
<html lang="en">

<head>
    <title>AtomInstaPay</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        var cdnScript = document.createElement('script');
        cdnScript.setAttribute('src', '$cdnUrl?v=' + Date.now());
        document.head.appendChild(cdnScript);
    </script>
</head>

<body>
    <p style="text-align:center;margin-top:20%;">Please wait</p>
    <p style="display: none;">AIPAYLocalFile</p>
    <script>
        function openPay(payDetails) {
            try {
                let convertedJson = JSON.parse(payDetails);
                const options = {
                    "atomTokenId": convertedJson.atomTokenId,
                    "merchId": convertedJson.merchId,
                    "custEmail": convertedJson.emailId,
                    "custMobile": convertedJson.mobileNumber,
                    "returnUrl": convertedJson.returnUrl,
                    "userAgent": "mobile_webView"
                }
                console.log("openPay options = ", JSON.stringify(options));
                new AtomPaynetz(options, '$paynetzMode');
            } catch (e) {
                ${AtomConstants.errorChannelName}.postMessage(e && e.message ? e.message : String(e));
            }
        }
        cdnScript.onload = function () {
            openPay(${jsonEncode(payDetails)});
        };
        cdnScript.onerror = function () {
            ${AtomConstants.errorChannelName}.postMessage('Failed to load Atom checkout script from $cdnUrl');
        };
    </script>
</body>

</html>
''';
  }
}
