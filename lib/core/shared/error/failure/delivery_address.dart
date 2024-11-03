part of 'failure.dart';

class DeliveryAddressModelParseFailure extends Failure {
  DeliveryAddressModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class DeliveryAddressNotFoundInLocalCacheFailure extends Failure {
  DeliveryAddressNotFoundInLocalCacheFailure()
      : super(
          message: 'DeliveryAddress not found in local cache.',
        );
}
