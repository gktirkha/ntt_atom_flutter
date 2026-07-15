import 'package:dio/dio.dart';

import '../constants/atom_constants.dart';

/// Builds preconfigured [Dio] instances used by the SDK for network requests.
sealed class DioBuilder {
  /// Creates a [Dio] instance configured with the SDK's default headers,
  /// including a `User-Agent` identifying this SDK and its version.
  static Dio buildDio() {
    final Dio dio = Dio(
      BaseOptions(
        headers: <String, dynamic>{'User-Agent': AtomConstants.userAgent},
      ),
    );
    return dio;
  }
}
