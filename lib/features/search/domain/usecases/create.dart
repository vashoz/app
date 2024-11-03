import '../../../../core/shared/shared.dart';
import '../../search.dart';

class CreateSearchUseCase {
  final SearchRepository repository;

  CreateSearchUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required SearchEntity search,
  }) async {
    return await repository.create(
      search: search,
    );
  }
}
