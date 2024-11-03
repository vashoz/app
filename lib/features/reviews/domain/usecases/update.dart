import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class UpdateReviewsUseCase {
  final ReviewsRepository repository;

  UpdateReviewsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required ReviewsEntity reviews,
  }) async {
    return await repository.update(
      reviews: reviews,
    );
  }
}
