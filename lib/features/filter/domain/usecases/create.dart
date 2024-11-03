import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class CreateFilterUseCase {
  final FilterRepository repository;

  CreateFilterUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required FilterEntity filter,
  }) async {
    return await repository.create(
      filter: filter,
    );
  }
}
