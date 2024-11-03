import '../../../../core/shared/shared.dart';
import '../../search.dart';

typedef SearchEntityPaginatedResponse = ({
  List<SearchEntity> items,
  int total,
});

abstract class SearchRepository {
  FutureOr<Either<Failure, void>> create({
    required SearchEntity search,
  });

  FutureOr<Either<Failure, void>> delete({
    required int id,
  });

  FutureOr<Either<Failure, SearchEntity>> find({
    required int id,
  });

  FutureOr<Either<Failure, List<SearchEntity>>> read();

  FutureOr<Either<Failure, List<SearchEntity>>> refresh();

  FutureOr<Either<Failure, List<SearchEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required SearchEntity search,
  });
}
