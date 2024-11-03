//! mason:linking-failures - DO NOT REMOVE THIS COMMENT --------------------------->
part 'reviews.dart';
part 'track_order.dart';
part 'business_information.dart';
part 'filter.dart';
part 'search.dart';
part 'variant.dart';
part 'banner.dart';
part 'favorite.dart';
part 'checkout.dart';
part 'payment_method.dart';
part 'delivery_address.dart';
part 'shipping_method.dart';
part 'products.dart';
part 'orders.dart';
part 'product_details.dart';
part 'categories.dart';
part 'discount.dart';
part 'settings.dart';
part 'profile.dart';
part 'dashboard.dart';
part 'forgot_password.dart';
part 'auth.dart';
part 'on_board.dart';

abstract class Failure {
  final String message;
  final StackTrace? stackTrace;

  Failure({
    required this.message,
    this.stackTrace,
  });

  @override
  String toString() => message;
}

class NoInternetFailure extends Failure {
  NoInternetFailure()
      : super(
          message: 'No internet connection.',
        );
}

class RemoteFailure extends Failure {
  RemoteFailure({
    required super.message,
  });
}
