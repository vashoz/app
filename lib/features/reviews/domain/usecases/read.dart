import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class ReadReviewsUseCase {
  final ReviewsRepository repository;

  ReadReviewsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ReviewsEntity>>> call() async {
    return await repository.read();
  }
}
