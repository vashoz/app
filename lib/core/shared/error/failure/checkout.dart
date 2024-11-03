part of 'failure.dart';

class CheckoutModelParseFailure extends Failure {
  CheckoutModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class CheckoutNotFoundInLocalCacheFailure extends Failure {
  CheckoutNotFoundInLocalCacheFailure()
      : super(
          message: 'Checkout not found in local cache.',
        );
}
