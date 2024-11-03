part of 'failure.dart';

class BannerModelParseFailure extends Failure {
  BannerModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class BannerNotFoundInLocalCacheFailure extends Failure {
  BannerNotFoundInLocalCacheFailure()
      : super(
          message: 'Banner not found in local cache.',
        );
}
