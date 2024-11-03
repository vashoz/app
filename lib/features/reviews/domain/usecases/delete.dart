import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class DeleteReviewsUseCase {
  final ReviewsRepository repository;

  DeleteReviewsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
