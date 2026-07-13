import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/enums/atom_env.dart';
import '../atom_return_url_config/atom_return_url_config.dart';

part 'atom_payment_options.freezed.dart';
part 'atom_payment_options.g.dart';

@freezed
sealed class AtomPaymentOptions with _$AtomPaymentOptions {
  const factory AtomPaymentOptions({
    @JsonKey(name: 'login') required String login,

    @JsonKey(name: 'password') required String password,

    @JsonKey(name: 'prodid') required String prodid,

    @JsonKey(name: 'amount') required String amount,

    @JsonKey(name: 'clientcode') required String clientcode,

    @JsonKey(name: 'txncurr') required String txncurr,

    @JsonKey(name: 'txnid') required String txnid,

    @JsonKey(name: 'mccCode') required String mccCode,

    @JsonKey(name: 'merchType') required String merchType,

    @JsonKey(name: 'requestHashKey') required String requestHashKey,

    @JsonKey(name: 'responseHashKey') required String responseHashKey,

    @JsonKey(name: 'requestencryptionKey') required String requestEncryptionKey,

    @JsonKey(name: 'responseencypritonKey')
    required String responseDecryptionKey,

    @JsonKey(name: 'returnUrlConfig') AtomReturnUrlConfig? returnUrlConfig,

    @JsonKey(name: 'mode') required AtomEnv mode,

    @JsonKey(name: 'custFirstName') String? custFirstName,

    @JsonKey(name: 'custLastName') String? custLastName,

    @JsonKey(name: 'mobile') String? mobile,

    @JsonKey(name: 'email') String? email,

    @JsonKey(name: 'address') String? address,

    @JsonKey(name: 'custacc') String? custacc,

    @JsonKey(name: 'udf1') String? udf1,

    @JsonKey(name: 'udf2') String? udf2,

    @JsonKey(name: 'udf3') String? udf3,

    @JsonKey(name: 'udf4') String? udf4,

    @JsonKey(name: 'udf5') String? udf5,
  }) = _AtomPaymentOptions;

  factory AtomPaymentOptions.fromJson(Map<String, dynamic> json) =>
      _$AtomPaymentOptionsFromJson(json);
}
