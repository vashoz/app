import '../../../../core/shared/shared.dart';
import '../../discount.dart';

typedef DiscountEntityPaginatedResponse = ({
  List<DiscountEntity> items,
  int total,
});

abstract class DiscountRepository {
  FutureOr<Either<Failure, void>> create({
    required DiscountEntity discount,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, DiscountEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<DiscountEntity>>> read();

  FutureOr<Either<Failure, List<DiscountEntity>>> refresh();

  FutureOr<Either<Failure, List<DiscountEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required DiscountEntity discount,
  });
}
