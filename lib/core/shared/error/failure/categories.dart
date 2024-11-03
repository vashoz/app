part of 'failure.dart';

class CategoriesModelParseFailure extends Failure {
  CategoriesModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class CategoriesNotFoundInLocalCacheFailure extends Failure {
  CategoriesNotFoundInLocalCacheFailure()
      : super(
          message: 'Categories not found in local cache.',
        );
}
