part of 'failure.dart';

class ProductDetailsModelParseFailure extends Failure {
  ProductDetailsModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class ProductDetailsNotFoundInLocalCacheFailure extends Failure {
  ProductDetailsNotFoundInLocalCacheFailure()
      : super(
          message: 'ProductDetails not found in local cache.',
        );
}
