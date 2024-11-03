part of 'failure.dart';

class ReviewsModelParseFailure extends Failure {
  ReviewsModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class ReviewsNotFoundInLocalCacheFailure extends Failure {
  ReviewsNotFoundInLocalCacheFailure()
      : super(
          message: 'Reviews not found in local cache.',
        );
}
