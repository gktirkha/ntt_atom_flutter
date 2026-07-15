/// Status codes returned by the Atom payment gateway.
sealed class AtomPgStatusCodes {
  /// Status codes that represent a successful transaction.
  static Set<String> success = {'OTS0000', 'OTS0551'};
}
