import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

typedef ReviewsEntityPaginatedResponse = ({
  List<ReviewsEntity> items,
  int total,
});

abstract class ReviewsRepository {
  FutureOr<Either<Failure, void>> create({
    required ReviewsEntity reviews,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, ReviewsEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<ReviewsEntity>>> read();

  FutureOr<Either<Failure, List<ReviewsEntity>>> refresh();

  FutureOr<Either<Failure, List<ReviewsEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required ReviewsEntity reviews,
  });
}
