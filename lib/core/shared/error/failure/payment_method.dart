part of 'failure.dart';

class PaymentMethodModelParseFailure extends Failure {
  PaymentMethodModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class PaymentMethodNotFoundInLocalCacheFailure extends Failure {
  PaymentMethodNotFoundInLocalCacheFailure()
      : super(
          message: 'PaymentMethod not found in local cache.',
        );
}
