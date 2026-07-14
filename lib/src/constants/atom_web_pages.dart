import 'dart:convert';

import 'atom_constants.dart';

sealed class AtomWebPages {
  static String prod(String payDetails) =>
      '''
<!DOCTYPE html>
<html lang="en">

<head>
    <title>AtomInstaPay</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        var cdnScript = document.createElement('script');
        cdnScript.setAttribute('src', 'https://psa.atomtech.in/staticdata/ots/js/atomcheckout.js?v=' + Date.now());
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
                let atom = new AtomPaynetz(options, 'uat');
            } catch (e) {
                ${AtomConstants.errorChannelName}.postMessage(e && e.message ? e.message : String(e));
            }
        }
        cdnScript.onload = function () {
            openPay(${jsonEncode(payDetails)});
        };
    </script>
</body>

</html>
''';

  static String uat(String payDetails) =>
      '''
<!DOCTYPE html>
<html lang="en">

<head>
    <title>AtomInstaPay</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        var cdnScript = document.createElement('script');
        cdnScript.setAttribute('src', 'https://pgtest.atomtech.in/staticdata/ots/js/atomcheckout.js?v=' + Date.now());
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
                let atom = new AtomPaynetz(options, 'uat');
            } catch (e) {
                ${AtomConstants.errorChannelName}.postMessage(e && e.message ? e.message : String(e));
            }
        }
        cdnScript.onload = function () {
            openPay(${jsonEncode(payDetails)});
        };
    </script>
</body>

</html>
''';
}
