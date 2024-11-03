part of 'failure.dart';

class VariantModelParseFailure extends Failure {
  VariantModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class VariantNotFoundInLocalCacheFailure extends Failure {
  VariantNotFoundInLocalCacheFailure()
      : super(
          message: 'Variant not found in local cache.',
        );
}
