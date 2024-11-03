part of 'failure.dart';

class OrdersModelParseFailure extends Failure {
  OrdersModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class OrdersNotFoundInLocalCacheFailure extends Failure {
  OrdersNotFoundInLocalCacheFailure()
      : super(
          message: 'Orders not found in local cache.',
        );
}
