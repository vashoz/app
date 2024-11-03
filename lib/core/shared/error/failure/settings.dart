part of 'failure.dart';

class SettingsModelParseFailure extends Failure {
  SettingsModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class SettingsNotFoundInLocalCacheFailure extends Failure {
  SettingsNotFoundInLocalCacheFailure()
      : super(
          message: 'Settings not found in local cache.',
        );
}
