import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class FindReviewsUseCase {
  final ReviewsRepository repository;

  FindReviewsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, ReviewsEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
