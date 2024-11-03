import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class CreateReviewsUseCase {
  final ReviewsRepository repository;

  CreateReviewsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required ReviewsEntity reviews,
  }) async {
    return await repository.create(
      reviews: reviews,
    );
  }
}
