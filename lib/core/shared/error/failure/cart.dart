import '../../shared.dart';

class CartModelParseFailure extends Failure {
  CartModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class CartNotFoundInLocalCacheFailure extends Failure {
  CartNotFoundInLocalCacheFailure()
      : super(
          message: 'Cart not found in local cache.',
        );
}
