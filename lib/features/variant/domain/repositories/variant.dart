import '../../../../core/shared/shared.dart';
import '../../variant.dart';

typedef VariantEntityPaginatedResponse = ({
  List<VariantEntity> items,
  int total,
});

abstract class VariantRepository {
  FutureOr<Either<Failure, void>> create({
    required VariantEntity variant,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, VariantEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<VariantEntity>>> read();

  FutureOr<Either<Failure, List<VariantEntity>>> refresh();

  FutureOr<Either<Failure, List<VariantEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required VariantEntity variant,
  });
}
