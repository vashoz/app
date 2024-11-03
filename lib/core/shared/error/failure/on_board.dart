part of 'failure.dart';

class OnBoardModelParseFailure extends Failure {
  OnBoardModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class OnBoardNotFoundInLocalCacheFailure extends Failure {
  OnBoardNotFoundInLocalCacheFailure()
      : super(
          message: 'OnBoard not found in local cache.',
        );
}
