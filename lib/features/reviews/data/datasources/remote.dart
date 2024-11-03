import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

abstract class ReviewsRemoteDataSource {
  FutureOr<void> create({
    required ReviewsEntity reviews,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<ReviewsModel> find({
    required String guid,
  });

  FutureOr<List<ReviewsModel>> read();

  FutureOr<List<ReviewsModel>> refresh();

  FutureOr<List<ReviewsModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required ReviewsEntity reviews,
  });
}
