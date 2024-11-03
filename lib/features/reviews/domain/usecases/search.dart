import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class SearchReviewsUseCase {
  final ReviewsRepository repository;

  SearchReviewsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ReviewsEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
