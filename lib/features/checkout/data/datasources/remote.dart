import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

typedef CheckoutModelPaginatedResponse = ({
  List<CheckoutModel> items,
  int total,
});

abstract class CheckoutRemoteDataSource {
  FutureOr<void> create({
    required CheckoutEntity checkout,
  });

  FutureOr<void> delete({
    required int id,
  });

  FutureOr<CheckoutModel> find({
    required int id,
  });

  FutureOr<CheckoutModelPaginatedResponse> read({
    required int page,
    required int limit,
  });

  FutureOr<CheckoutModelPaginatedResponse> refresh({
    required int page,
    required int limit,
  });

  FutureOr<CheckoutModelPaginatedResponse> search({
    required int page,
    required int limit,
    required String query,
  });

  FutureOr<void> update({
    required CheckoutEntity checkout,
  });
}
