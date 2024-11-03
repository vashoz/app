import '../../../../core/shared/shared.dart';
import '../../category.dart';

class FindAllCategoriesUseCase {
  final CategoriesRepository repository;

  FindAllCategoriesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<String>>> call() async {
    return await repository.all();
  }
}
