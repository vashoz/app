import '../shared.dart';

abstract class NetworkInfo implements InternetConnectionChecker {
  Future<bool> get online;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({
    required this.internetConnectionChecker,
    required this.addresses,
  });

  @override
  Duration get checkInterval => const Duration(seconds: 10);

  @override
  Future<InternetConnectionStatus> get connectionStatus =>
      internetConnectionChecker.connectionStatus;

  @override
  Future<bool> get hasConnection => internetConnectionChecker.hasConnection;

  @override
  Future<bool> get online => internetConnectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get onStatusChange =>
      internetConnectionChecker.onStatusChange;

  @override
  List<AddressCheckOptions> addresses;

  @override
  Duration get checkTimeout => throw UnimplementedError();

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  bool get isActivelyChecking => throw UnimplementedError();

  @override
  Future<AddressCheckResult> isHostReachable(AddressCheckOptions options) {
    throw UnimplementedError();
  }
}
