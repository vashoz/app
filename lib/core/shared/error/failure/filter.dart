part of 'failure.dart';

class FilterModelParseFailure extends Failure {
  FilterModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class FilterNotFoundInLocalCacheFailure extends Failure {
  FilterNotFoundInLocalCacheFailure()
      : super(
          message: 'Filter not found in local cache.',
        );
}
