import '../../../../core/shared/shared.dart';
import '../../search.dart';

class UpdateSearchUseCase {
  final SearchRepository repository;

  UpdateSearchUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required SearchEntity search,
  }) async {
    return await repository.update(
      search: search,
    );
  }
}
