/// An abstract class that provides static HTML page templates for production and UAT environments.
///
/// These pages are used for AtomInstaPay integration and include embedded JavaScript
/// to load the Atom payment checkout script dynamically.
abstract class WebPages {
  /// Production HTML page for AtomInstaPay.
  ///
  /// This page includes the Atom payment checkout script from the production CDN
  /// and defines a JavaScript function `openPay` to initialize payments.
  static String prod = '''
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
let convertedJson = JSON.parse(payDetails);
const options = {
"atomTokenId": convertedJson.atomTokenId,
"merchId": convertedJson.merchId,
"custEmail": convertedJson.emailId,
"custMobile": convertedJson.mobileNumber,
"returnUrl": convertedJson.returnUrl,
"userAgent": "mobile_webView"
}
console.log("openPay options = ", payDetails);
let atom = new AtomPaynetz(options, 'uat');
}
</script>
</body>
</html>
''';

  /// UAT (User Acceptance Testing) HTML page for AtomInstaPay.
  ///
  /// This page loads the Atom payment checkout script from the UAT environment
  /// and defines a JavaScript function `openPay` for testing payment integrations.
  static String uat = '''
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
let convertedJson = JSON.parse(payDetails);
const options = {
"atomTokenId": convertedJson.atomTokenId,
"merchId": convertedJson.merchId,
"custEmail": convertedJson.emailId,
"custMobile": convertedJson.mobileNumber,
"returnUrl": convertedJson.returnUrl,
"userAgent": "mobile_webView"
}
console.table("openPay options = ", options);
let atom = new AtomPaynetz(options, 'uat');
}
</script>
</body>
</html>
''';
}
