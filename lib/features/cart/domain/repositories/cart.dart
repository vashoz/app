import '../../../../core/shared/shared.dart';
import '../../cart.dart';

typedef CartEntityPaginatedResponse = ({
  List<CartEntity> items,
  int total,
});

abstract class CartRepository {
  FutureOr<Either<Failure, void>> create({
    required CartEntity cart,
  });

  FutureOr<Either<Failure, void>> delete({
    required int id,
  });

  FutureOr<Either<Failure, CartEntity>> find({
    required int id,
  });

  FutureOr<Either<Failure, List<CartEntity>>> read();

  FutureOr<Either<Failure, List<CartEntity>>> refresh();

  FutureOr<Either<Failure, List<CartEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required CartEntity cart,
  });
}
