/// A data model representing the payment options for an Atom transaction.
///
/// This class uses `freezed` for immutability and JSON serialization.
/// It includes all necessary fields required for making a transaction
/// through Atom's payment gateway.
library;

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'atom_constants.dart';

part 'atom_payment_options.freezed.dart';
part 'atom_payment_options.g.dart';

@freezed
/// Options To be configured for SDK to work
class AtomPaymentOptions with _$AtomPaymentOptions {
  /// Creates an instance of [AtomPaymentOptions].
  ///
  /// All required fields must be provided for proper functioning.
  const factory AtomPaymentOptions({
    /// The login credential for the merchant account.
    @JsonKey(name: 'login') required String login,

    /// The password associated with the merchant login.
    @JsonKey(name: 'password') required String password,

    /// The product ID assigned to the merchant.
    @JsonKey(name: 'prodid') required String prodid,

    /// The transaction amount.
    @JsonKey(name: 'amount') required String amount,

    /// The client code identifying the customer.
    @JsonKey(name: 'clientcode') required String clientcode,

    /// The currency of the transaction.
    @JsonKey(name: 'txncurr') required String txncurr,

    /// The unique transaction ID.
    @JsonKey(name: 'txnid') required String txnid,

    /// The Merchant Category Code (MCC).
    @JsonKey(name: 'mccCode') required String mccCode,

    /// The merchant type identifier.
    @JsonKey(name: 'merchType') required String merchType,

    /// The key used to generate request hash.
    @JsonKey(name: 'requestHashKey') required String requestHashKey,

    /// The key used to verify response hash.
    @JsonKey(name: 'responseHashKey') required String responseHashKey,

    /// The encryption key for securing request data.
    @JsonKey(name: 'requestencryptionKey') required String requestEncryptionKey,

    /// The decryption key for reading response data.
    @JsonKey(name: 'responseencypritonKey')
    required String responseDecryptionKey,

    /// The return URL after the transaction is processed.
    /// Defaults to `AtomConstants.defaultUrl`.
    /// if custom url is used, SDK wont be able to return response and transaction status (what ever the url returns will be returned as string)
    @Default(AtomConstants.defaultUrl)
    @JsonKey(name: 'returnUrl')
    String returnUrl,

    /// The payment mode for the transaction.
    @JsonKey(name: 'mode') required AtomPaymentMode mode,

    /// The first name of the customer (optional).
    @JsonKey(name: 'custFirstName') String? custFirstName,

    /// The last name of the customer (optional).
    @JsonKey(name: 'custLastName') String? custLastName,

    /// The customer's mobile number (optional).
    @JsonKey(name: 'mobile') String? mobile,

    /// The customer's email address (optional).
    @JsonKey(name: 'email') String? email,

    /// The customer's billing address (optional).
    @JsonKey(name: 'address') String? address,

    /// The customer's account number (optional).
    @JsonKey(name: 'custacc') String? custacc,

    /// User-defined field 1 (optional).
    @JsonKey(name: 'udf1') String? udf1,

    /// User-defined field 2 (optional).
    @JsonKey(name: 'udf2') String? udf2,

    /// User-defined field 3 (optional).
    @JsonKey(name: 'udf3') String? udf3,

    /// User-defined field 4 (optional).
    @JsonKey(name: 'udf4') String? udf4,

    /// User-defined field 5 (optional).
    @JsonKey(name: 'udf5') String? udf5,
  }) = _AtomPaymentOptions;

  /// Creates an instance of [AtomPaymentOptions] from a JSON object.
  factory AtomPaymentOptions.fromJson(Map<String, dynamic> json) =>
      _$AtomPaymentOptionsFromJson(json);
}
