import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

abstract class ReviewsLocalDataSource {
  FutureOr<void> add({
    required ReviewsEntity reviews,
  });

  FutureOr<void> addAll({
    required List<ReviewsEntity> items,
  });

  FutureOr<void> update({
    required ReviewsEntity reviews,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<ReviewsEntity> find({
    required String guid,
  });
}
