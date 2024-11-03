import '../../../../core/shared/shared.dart';
import '../../category.dart';

class RefreshAllCategoriesUseCase {
  final CategoriesRepository repository;

  RefreshAllCategoriesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<String>>> call() async {
    return await repository.refresh();
  }
}
