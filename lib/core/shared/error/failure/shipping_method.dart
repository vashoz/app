part of 'failure.dart';

class ShippingMethodModelParseFailure extends Failure {
  ShippingMethodModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class ShippingMethodNotFoundInLocalCacheFailure extends Failure {
  ShippingMethodNotFoundInLocalCacheFailure()
      : super(
          message: 'ShippingMethod not found in local cache.',
        );
}
