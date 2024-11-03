part of 'failure.dart';

class DiscountModelParseFailure extends Failure {
  DiscountModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class DiscountNotFoundInLocalCacheFailure extends Failure {
  DiscountNotFoundInLocalCacheFailure()
      : super(
          message: 'Discount not found in local cache.',
        );
}
