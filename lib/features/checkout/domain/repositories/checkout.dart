import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

typedef CheckoutEntityPaginatedResponse = ({
  List<CheckoutEntity> items,
  int total,
});

abstract class CheckoutRepository {
  FutureOr<Either<Failure, void>> create({
    required CheckoutEntity checkout,
  });

  FutureOr<Either<Failure, void>> delete({
    required int id,
  });

  FutureOr<Either<Failure, CheckoutEntity>> find({
    required int id,
  });

  FutureOr<Either<Failure, CheckoutEntityPaginatedResponse>> read({
    required int page,
    required int limit,
  });

  FutureOr<Either<Failure, CheckoutEntityPaginatedResponse>> refresh({
    required int page,
    required int limit,
  });

  FutureOr<Either<Failure, CheckoutEntityPaginatedResponse>> search({
    required int page,
    required int limit,
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required CheckoutEntity checkout,
  });
}
