part of 'failure.dart';

class SearchModelParseFailure extends Failure {
  SearchModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class SearchNotFoundInLocalCacheFailure extends Failure {
  SearchNotFoundInLocalCacheFailure()
      : super(
          message: 'Search not found in local cache.',
        );
}
