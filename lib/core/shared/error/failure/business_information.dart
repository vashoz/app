part of 'failure.dart';

class BusinessInformationModelParseFailure extends Failure {
  BusinessInformationModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class BusinessInformationNotFoundInLocalCacheFailure extends Failure {
  BusinessInformationNotFoundInLocalCacheFailure()
      : super(
          message: 'BusinessInformation not found in local cache.',
        );
}
