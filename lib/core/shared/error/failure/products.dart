part of 'failure.dart';

class ProductsModelParseFailure extends Failure {
  ProductsModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class ProductsNotFoundInLocalCacheFailure extends Failure {
  ProductsNotFoundInLocalCacheFailure()
      : super(
          message: 'Products not found in local cache.',
        );
}
