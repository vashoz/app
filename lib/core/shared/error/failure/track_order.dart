part of 'failure.dart';

class TrackOrderModelParseFailure extends Failure {
  TrackOrderModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class TrackOrderNotFoundInLocalCacheFailure extends Failure {
  TrackOrderNotFoundInLocalCacheFailure()
      : super(
          message: 'TrackOrder not found in local cache.',
        );
}
