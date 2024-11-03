part of 'failure.dart';

class FavoriteModelParseFailure extends Failure {
  FavoriteModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class FavoriteNotFoundInLocalCacheFailure extends Failure {
  FavoriteNotFoundInLocalCacheFailure()
      : super(
          message: 'Favorite not found in local cache.',
        );
}
