import '../../../../core/shared/shared.dart';
import '../../filter.dart';

typedef FilterEntityPaginatedResponse = ({
  List<FilterEntity> items,
  int total,
});

abstract class FilterRepository {
  FutureOr<Either<Failure, void>> create({
    required FilterEntity filter,
  });

  FutureOr<Either<Failure, void>> delete({
    required int id,
  });

  FutureOr<Either<Failure, FilterEntity>> find({
    required int id,
  });

  FutureOr<Either<Failure, List<FilterEntity>>> read();

  FutureOr<Either<Failure, List<FilterEntity>>> refresh();

  FutureOr<Either<Failure, List<FilterEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required FilterEntity filter,
  });
}
