part of 'failure.dart';

class ForgotPasswordModelParseFailure extends Failure {
  ForgotPasswordModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class ForgotPasswordNotFoundInLocalCacheFailure extends Failure {
  ForgotPasswordNotFoundInLocalCacheFailure()
      : super(
          message: 'ForgotPassword not found in local cache.',
        );
}
