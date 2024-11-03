import '../../../../core/shared/shared.dart';
import '../../category.dart';

class SearchCategoriesUseCase {
  final CategoriesRepository repository;

  SearchCategoriesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<String>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
