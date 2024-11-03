import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class RefreshReviewsUseCase {
  final ReviewsRepository repository;

  RefreshReviewsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ReviewsEntity>>> call() async {
    return await repository.refresh();
  }
}
