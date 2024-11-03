part of 'failure.dart';

class AuthModelParseFailure extends Failure {
  AuthModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class AuthNotFoundInLocalCacheFailure extends Failure {
  AuthNotFoundInLocalCacheFailure()
      : super(
          message: 'Auth not found in local cache.',
        );
}
